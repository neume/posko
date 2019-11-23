class ApplicationController < ActionController::API
  include Querykoable
  before_action :check_session
  before_action :set_raven_context
  helper_method :current_user, :current_account

  rescue_from ActiveRecord::RecordNotFound do
    render status: 404, json: {
      error: {
        message: 'Record not found',
        code: 404
      }
    }
  end

  def current_user
    @current_user ||= User.find_by(id: request.headers["X-Posko-User-Token"] )
  end

  def current_account
    @current_account ||= current_user.account
  end

  private

  def check_session
    return if current_user

    render_unauthorized
  end

  def set_raven_context
    Raven.user_context(id: current_user.try(:id)) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def render_unauthorized
    render status: :unauthorized, json: { message: 'Unauthorized' }
  end

  def render_record_invalid(obj)
    render status: :unprocessable_entity, json: { errors: obj.errors }
  end

  def blueprint(obj, options = {})
    model_name, hash_object = derive_blueprint_keys obj
    blueprint_klass = "#{model_name}Blueprint".constantize

    { hash_object => blueprint_klass.render_as_hash(obj, options) }
  end

  def derive_blueprint_keys(obj)
    model_name = obj.model_name.name
    hash_object = if obj.class.name.split('::').last == 'AssociationRelation' ||
                     obj.class.name.split('::').last == 'CollectionProxy'
                    model_name.pluralize.underscore
                  else
                    model_name.underscore
                  end
    [model_name, hash_object]
  end
end

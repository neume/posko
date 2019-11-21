class Api::V1::AccessKeysController < Api::V1::ApiController
  before_action :authenticate_user
  def index
    @access_keys = AccessKeysQuery.new(query_params, current_user.access_keys).call
    render json: { access_keys: @access_keys }
  end

  def count
    @access_keys = AccessKeysQuery.new(query_params, current_user.access_keys).call
    render json: { count: @access_keys.count }
  end
end

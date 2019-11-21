class Api::V1::ApiController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include Querykoable

  helper_method :current_user, :current_account

  private

  def current_user
    @current_user ||= @current_access_key.user
  end

  def current_account
    @current_account ||= current_user.account
  end

  def authenticate_user
    authenticate_or_request_with_http_basic do |token, auth_token|
      @current_access_key = AccessKey.find_by token: token
      if @current_access_key && @current_access_key.auth_token == auth_token
        @current_user = @current_access_key.user
      end
    end
  end
end

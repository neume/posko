class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticate_user
  def index
    @users = UsersQuery.new(query_params, current_account.users).call
    render json: { users: @users }
  end

  def count
    @users = UsersQuery.new(query_params, current_account.users).call
    render json: { count: @users.count }
  end
end

class Api::V1::CustomersController < Api::V1::ApiController
  before_action :authenticate_user
  def index
    @customers = CustomersQuery.new(query_params, current_account.customers).call
    render json: { customers: @customers }
  end

  def count
    @customers = CustomersQuery.new(query_params, current_account.customers).call
    render json: { count: @customers.count }
  end

  def create
    @customer = current_account.customers.new customer_params
    if @customer.save
      render json: { customer: @customer }
    else
      render status: :unprocessable_entity, json: {
        messages: @customer.errors.full_messages
      }
    end
  end

  def show
    @customer = current_account.customers.find_by id: params[:id]
    if @customer
      render json: { customer: @customer }
    else
      render status: :not_found, json: { messages: ['Customer not found'] }
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email)
  end
end

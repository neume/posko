class Api::V1::ProductsController < Api::V1::ApiController
  before_action :authenticate_user
  def index
    @products = ProductsQuery.new(query_params, Product.all).call
  end

  def count
    @products = ProductsQuery.new(query_params, Product.all).call
    render json: { count: @products.count }
  end

  def show
    @product = current_account.products.find_by id: params[:id]
    return if @product

    render status: :not_found, json: { messages: ['Variant not found'] }
  end

  private

  def product_params
    params.require(:product).permit(:first_name, :last_name, :email)
  end

  def query_fields
    default_query_fields.push :ids
  end
end

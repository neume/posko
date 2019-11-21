class Api::V1::OptionTypesController < Api::V1::ApiController
  before_action :authenticate_user
  def index
    @option_types = OptionTypesQuery.new(query_params, product.option_types).call
    render json: { option_types: @option_types }
  end

  def count
    @option_types = OptionTypesQuery.new(query_params, product.option_types).call
    render json: { count: @option_types.count }
  end

  def show
    @option_type = OptionType.find_by id: params[:id]
    if @option_type
      render json: { option_type: @option_type }
    else
      render status: :not_found, json: { messages: ['Option Type not found'] }
    end
  end

  private

  def product
    @product ||= current_account.products.find(params[:product_id])
  end
end

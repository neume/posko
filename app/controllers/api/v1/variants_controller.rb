class Api::V1::VariantsController < Api::V1::ApiController
  before_action :authenticate_user
  def index
    render json: { variants: variants }
  end

  def count
    render json: { count: variants.count }
  end

  def show
    @variant = Variant.find_by id: params[:id]
    if @variant
      render json: { variant: @variant }
    else
      render status: :not_found, json: { messages: ['Variant not found'] }
    end
  end

  private

  def product_params
    params.require(:product).permit(:first_name, :last_name, :email)
  end

  def variants
    if params[:product_id]
      VariantsQuery.new(query_params, product.variants).call
    else
      VariantsQuery.new(query_params, current_account.variants).call
    end
  end

  def product
    @product ||= current_account.products.find(params[:product_id])
  end
end

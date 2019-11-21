class VariantsController < ApplicationController
  def index
    @variants = source_parent.variants.active_status
    render json: blueprint(VariantsQuery.new(query_params, @variants).call)
  end

  def count
    @variants = source_parent.variants.active_status
    render json: { count: VariantsQuery.new(query_params, @variants).total_count }
  end

  def create
    @variant = product.variants.new variant_params
    if variant.save
      render json: blueprint(variant)
    else
      render_record_invalid(variant)
    end
  end

  def update
    if variant.update variant_params
      render json: blueprint(variant)
    else
      render_record_invalid(variant)
    end
  end

  def show
    render json: blueprint(variant)
  end

  def destroy
    variant.destroy
    render json: blueprint(variant)
  end

  private

  def variant
    @variant ||= current_account.variants.find(params[:id])
  end

  def product
    @product ||= current_account.products.find(params[:product_id])
  end

  def source_parent
    params[:product_id] ? product : current_account
  end

  def variant_params
    params.require(:variant).permit(:price, :sku, :variant_type,
                                    option_value_ids: [])
  end
end

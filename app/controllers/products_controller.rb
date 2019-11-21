class ProductsController < ApplicationController
  def index
    @products = current_account.products.active_status
    render json: blueprint(ProductsQuery.new(query_params, @products).call)
    # TODO: Implement CSV
    # format.csv { csv_format }
  end

  def count
    @products = current_account.products.active_status
    render json: { count: ProductsQuery.new(query_params, @products).total_count }
  end

  def create
    @product = ProductForm.new product_params.merge(created_by: current_user)

    if product.save
      render json: product
    else
      render_record_invalid(product)
    end
  end

  def update
    if product.update(product_params)
      render json: blueprint(product)
    else
      render_record_invalid(product)
    end
  end

  def show
    render json: blueprint(product)
  end

  def destroy
    product.destroy
    render json: blueprint(product)
  end

  # def import
  #   @importer = ProductImporter.new(
  #     filepath: params[:file].path,
  #     user_id: current_user.id,
  #     account_id: current_account.id
  #   )
  #
  #   if @importer.perform
  #     render json: { message: 'Import success'}
  #   else
  #     render status: :unprocessable_entity,
  #       json: { message: 'Something went wrong importing product csv'}
  #   end
  # end

  private

  def product
    @product ||= current_account.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :cost, :barcode,
                                    :open_price, :selling_policy, :sku, category_ids: [])
  end

  # def csv_format
  #   exporter = ProductExporter.new(records: @products)
  #   send_data exporter.csv, filename: 'products.csv'
  # end
end

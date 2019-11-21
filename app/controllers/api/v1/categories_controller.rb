class Api::V1::CategoriesController < Api::V1::ApiController
  before_action :authenticate_user
  def index
    @categories = CategoriesQuery.new(query_params, current_account.categories).call
    render json: { categories: @categories }
  end

  def count
    @categories = CategoriesQuery.new(query_params, current_account.categories).call
    render json: { count: @categories.count }
  end

  def show
    @category = current_account.categories.find_by id: params[:id]
    if @category
      render json: { category: @category }
    else
      render status: :not_found, json: { messages: ['Category not found'] }
    end
  end
end

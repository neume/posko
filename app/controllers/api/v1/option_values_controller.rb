class Api::V1::OptionValuesController < Api::V1::ApiController
  before_action :authenticate_user
  def index
    @option_values = OptionValuesQuery.new(
      query_params,
      option_type.option_values
    ).call
    render json: { option_values: @option_values }
  end

  def count
    @option_values = OptionValuesQuery.new(
      query_params,
      option_type.option_values
    ).call
    render json: { count: @option_values.count }
  end

  def show
    @option_value = current_account.option_values.find_by id: params[:id]
    if @option_value
      render json: { option_value: @option_value }
    else
      render status: :not_found, json: { messages: ['Option Type not found'] }
    end
  end

  private

  def option_type
    @option_type ||= current_account.option_types.find(params[:option_type_id])
  end
end

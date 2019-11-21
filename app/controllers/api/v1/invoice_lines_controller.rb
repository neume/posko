class Api::V1::InvoiceLinesController < Api::V1::ApiController
  before_action :authenticate_user
  def index
    @invoice_lines = InvoiceLinesQuery.new(query_params, invoice.invoice_lines).call
    render json: { invoice_lines: @invoice_lines }
  end

  def show
    @invoice_line = InvoiceLine.find_by id: params[:id]
    if @invoice_line
      render json: { invoice_line: @invoice_line }
    else
      render status: :not_found, json: { messages: ['Invoice not found'] }
    end
  end

  private

  def invoice_line_params
    params.require(:invoice_line).permit(:variant_id,
                                         :product_id,
                                         :title,
                                         :price)
  end

  def invoice
    @invoice ||= current_account.invoices.find(params[:invoice_id])
  end
end

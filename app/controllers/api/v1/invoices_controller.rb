class Api::V1::InvoicesController < Api::V1::ApiController
  before_action :authenticate_user
  def index
    @invoices = InvoicesQuery.new(query_params, current_account.invoices).call
    render json: { invoices: @invoices }
  end

  def count
    @invoices = InvoicesQuery.new(query_params, current_account.invoices).call
    render json: { count: @invoices.count }
  end

  def create
    @invoice_form = InvoiceForm.new(invoice_params)
    @invoice_form.user = current_user
    @invoice_form.account = current_account
    if @invoice_form.save
      render json: { invoice: @invoice_form.invoice }
    else
      render status: :unprocessable_entity, json: {
        messages: @invoice_form.errors.full_messages
      }
    end
  end

  def show
    @invoice = current_account.invoices.find_by id: params[:id]
    if @invoice
      render json: { invoice: @invoice }
    else
      render status: :not_found, json: { messages: ['Invoice not found'] }
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(
      :invoice_number,
      :subtotal,
      invoice_lines: invoice_line_params,
      customer: [:id, :first_name, :last_name, :email]
    )
  end

  def invoice_line_params
    [:variant_id, :product_id, :price, :title, :quantity, :weight]
  end
end

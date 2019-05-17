class InvoicesController < ApplicationController
  def index
    @invoices = current_account.invoices
  end

  def new
    @invoice = current_account.invoices.new
  end

  def create
    @invoice = current_account.invoices.new invoice_params
    invoice.user = current_user
    if invoice.save
      redirect_to invoices_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if invoice.update(invoice_params)
      redirect_to invoices_path
    else
      render 'edit'
    end
  end

  def show
    render json: blueprint(invoice)
  end

  def destroy
    invoice.destroy
    render json: blueprint(invoice)
  end

  private

  def invoice
    @invoice ||= current_account.invoices.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:customer_id, :invoice_number)
  end
end

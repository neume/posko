class InvoiceValidator < ActiveModel::Validator
  attr_reader :incomplete_attributes, :record, :subtotal
  def validate(record)
    @record = record
    @subtotal = 0
    record.invoice_lines.each do |line|
      check_attributes line
      # stop accumulating if attributes are incomplete
      add_line_amount line unless incomplete_attributes
    end
  end

  def add_line_amount(line)
    @subtotal += line[:price].to_f * line[:quantity].to_f
  end

  def required_attributes
    [:variant_id, :quantity, :price]
  end

  def check_attributes(line)
    required_attributes.each do |attribute|
      next if line[attribute]

      record.errors.add(attribute,
                        "does not exist on item #{line[:variant_id]}")
      @incomplete_attributes = true
    end
  end
end

class InvoicesQuery < Queryko::Base
  feature :created_at, :min
  feature :created_at, :max
  feature :updated_at, :min
  feature :updated_at, :max
end

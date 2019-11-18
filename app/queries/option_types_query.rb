class OptionTypesQuery < Queryko::Base
  feature :created_at, :min
  feature :created_at, :max
  feature :updated_at, :min
  feature :updated_at, :max

  feature :id, :min
  feature :id, :max

  feature :name, :search, as: :name
end

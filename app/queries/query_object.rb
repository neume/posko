class QueryObject < Queryko::Base
  feature :id, :after, as: :since_id
  feature :id, :batch, as: :ids

  feature :id, :min
  feature :id, :max
  feature :created_at, :min
  feature :created_at, :max
  feature :updated_at, :min
  feature :updated_at, :max

  feature :paginate, :paginate, upper: 100, lower: 1

  default_param :paginate, true
  default_param :limit, 50
end

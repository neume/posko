module Querykoable
  extend ActiveSupport::Concern

  private

  def query_params
    params.permit(query_fields).to_hash.merge(override_fields).symbolize_keys
  end

  def default_query_fields
    [:page, :limit, :created_at_min, :created_at_max, :updated_at_min,
      :updated_at_max, :since_id, :id_min, :id_max, ids: []]
  end

  def query_fields
    default_query_fields
  end

  def override_fields
    {}
  end
end

module Querykoable
  extend ActiveSupport::Concern

  private

  def query_params
    params.permit(query_fields).to_hash.merge(override_fields).symbolize_keys
  end

  def query_fields
    [:page, :limit]
  end

  def override_fields
    {}
  end
end

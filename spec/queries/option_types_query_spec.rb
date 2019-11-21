require 'rails_helper'

RSpec.describe OptionTypesQuery, type: :query do
  # let(:account) { create(:account) }
  # let(:product) { create(:product, account: account) }
  # let(:option_types) do
  #   ['Juice', 'Clothing', 'Pants'].collect do |o|
  #     create(:option_type, name: o, product: product)
  #   end
  # end
  # let(:query) { OptionTypesQuery.new params, product.option_types }
  #
  # before { option_types }
  #
  # describe '#call' do
  #   let(:params) do
  #     {
  #       ids: [option_types[0].id, option_types[1].id],
  #       id_min: option_types[1].id
  #     }
  #   end
  #
  #   it 'filters query with params' do
  #     expect(query.call.count).to eq(1)
  #   end
  # end
  #
  # context 'when using ids' do
  #   let(:params) { { ids: [option_types[0].id, option_types[1].id] } }
  #
  #   it 'filters query' do
  #     expect(query.call.count).to eq(2)
  #   end
  # end
  #
  # context 'when using limit' do
  #   let(:params) { { limit: 2, page: 1 } }
  #
  #   it 'filters query' do
  #     expect(query.call.count).to eq(2)
  #   end
  # end
  #
  # describe 'page' do
  #   context 'with value 1' do
  #     let(:params) { { limit: 2, page: 1 } }
  #
  #     it 'returns first page' do
  #       expect(query.call.count).to eq(2)
  #     end
  #   end
  #
  #   context 'with value 2' do
  #     let(:params) { { limit: 2, page: 2 } }
  #
  #     it 'returns first page' do
  #       expect(query.call.count).to eq(1)
  #     end
  #   end
  # end
  #
  # context 'when using since_id' do
  #   let(:params) { { since_id: option_types[1].id } }
  #
  #   it 'returns list of option_types' do
  #     expect(query.call.count).to eq(1)
  #   end
  # end
  #
  # describe '#add_range_attributes' do
  #   it 'adds created_at' do
  #     expect(OptionTypesQuery.range_attributes.count).to eq(3)
  #   end
  # end
end

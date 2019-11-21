require 'rails_helper'

RSpec.describe OptionValuesQuery, value: :query do
  # let(:account) { create(:account) }
  # let(:product) { create(:product, account: account) }
  # let(:option_type) { create(:option_type, product: product) }
  # let(:option_values) do
  #   ['Small', 'Medium', 'Large'].collect do |o|
  #     create(:option_value, name: o, option_type: option_type)
  #   end
  # end
  # let(:query) { described_class.new params, option_type.option_values }
  #
  # before { option_values }
  #
  # describe '#call' do
  #   let(:params) do
  #     {
  #       ids: [option_values[0].id, option_values[1].id],
  #       id_min: option_values[1].id
  #     }
  #   end
  #
  #   it 'filters query with params' do
  #     expect(query.call.count).to eq(1)
  #   end
  # end
  #
  # context 'when using ids' do
  #   let(:params) { { ids: [option_values[0].id, option_values[1].id] } }
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
  #   let(:params) { { since_id: option_values[1].id } }
  #
  #   it 'returns list of option_values' do
  #     expect(query.call.count).to eq(1)
  #   end
  # end
  #
  # describe '#add_range_attributes' do
  #   it 'adds created_at' do
  #     expect(OptionValuesQuery.range_attributes.count).to eq(3)
  #   end
  # end
end

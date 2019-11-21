require 'rails_helper'

RSpec.describe ProductsQuery, type: :query do
  # let(:account) { create(:account) }
  # let(:products) { create_list(:product, 3, account: account) }
  # let(:query) { ProductsQuery.new params, account.products }
  #
  # before { products }
  #
  # describe '#call' do
  #   let(:params) do
  #     {
  #       ids: [products[0].id, products[1].id],
  #       id_min: products[1].id
  #     }
  #   end
  #
  #   it 'filters query with params' do
  #     expect(query.call.count).to eq(1)
  #   end
  # end
  #
  # context 'when using ids' do
  #   let(:params) { { ids: [products[0].id, products[1].id] } }
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
  #   let(:params) { { since_id: products[1].id } }
  #
  #   it 'returns list of products' do
  #     expect(query.call.count).to eq(1)
  #   end
  # end
  #
  # context 'when using attribute_min' do
  #   it 'returns products with min created_at' do
  #     # TODO: Improve this test
  #     # there are 3 default products
  #     Timecop.freeze(Time.current + 1.day)
  #     product1 = create(:product, account: account)
  #     Timecop.return
  #     Timecop.freeze(Time.current + 2.days)
  #     create(:product, account: account)
  #     Timecop.return
  #     q = ProductsQuery.new({ created_at_min: product1.created_at },
  #                           account.products)
  #     expect(q.call.count).to eq(2)
  #   end
  #
  #   it 'returns products with max created_at' do
  #     # TODO: Improve this test
  #     # there are 3 default products
  #     # create products before the the current date
  #     Timecop.freeze(Time.current - 1.day)
  #     product1 = create(:product, account: account)
  #     Timecop.return
  #     Timecop.freeze(Time.current - 2.days)
  #     create(:product, account: account)
  #     Timecop.return
  #     q = ProductsQuery.new({ created_at_max: product1.created_at + 1 },
  #                           account.products)
  #     expect(q.call.count).to eq(2)
  #   end
  # end
  #
  # describe '#add_range_attributes' do
  #   it 'adds created_at' do
  #     expect(ProductsQuery.range_attributes.count).to eq(3)
  #   end
  # end
end

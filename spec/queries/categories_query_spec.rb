require 'rails_helper'

RSpec.describe CategoriesQuery, type: :query do
  # let(:account) { create(:account) }
  # let(:categories) do
  #   c = []
  #   c << create(:category, name: 'Juice', account: account)
  #   c << create(:category, name: 'Clothing', account: account)
  #   c << create(:category, name: 'Pants', account: account)
  #   c
  # end
  # let(:query) { described_class.new params, account.categories }
  #
  # before { categories }
  #
  # describe '#call' do
  #   let(:params) do
  #     {
  #       ids: [categories[0].id, categories[1].id],
  #       id_min: categories[1].id
  #     }
  #   end
  #
  #   it 'filters query with params' do
  #     puts query.fields.keys
  #     puts '-' * 10
  #     puts query.call.class
  #     expect(query.call.count).to eq(1)
  #   end
  # end
  #
  # context 'when using ids' do
  #   let(:params) { { ids: [categories[0].id, categories[1].id] } }
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
  #   let(:params) { { since_id: categories[1].id } }
  #
  #   it 'returns list of categories' do
  #     expect(query.call.count).to eq(1)
  #   end
  # end
  #
  # context 'when using attribute_min' do
  #   it 'returns categories with min created_at' do
  #     # TODO: Improve this test
  #     # there are 3 default categories
  #     Timecop.freeze(Time.current + 1.day)
  #     category1 = create(:category, name: 'Phone', account: account)
  #     Timecop.return
  #     Timecop.freeze(Time.current + 2.days)
  #     create(:category, name: 'Shirt', account: account)
  #     Timecop.return
  #     q = described_class.new({ created_at_min: category1.created_at },
  #                             account.categories)
  #     expect(q.call.count).to eq(2)
  #   end
  #
  #   it 'returns categories with max created_at' do
  #     # TODO: Improve this test
  #     # there are 3 default categories
  #     # create categories before the the current date
  #     Timecop.freeze(Time.current - 1.day)
  #     category1 = create(:category, name: 'Phone', account: account)
  #     Timecop.return
  #     Timecop.freeze(Time.current - 2.days)
  #     create(:category, name: 'Shirt', account: account)
  #     Timecop.return
  #     q = described_class.new({ created_at_max: category1.created_at + 1 },
  #                             account.categories)
  #     expect(q.call.count).to eq(2)
  #   end
  # end
end

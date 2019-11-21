require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :request do
  let(:user) { create(:user) }
  let(:account) { user.account }
  let(:product) { create(:product, account: user.account) }
  let(:access_key) { user.access_keys.first }
  let(:headers) do
    token = access_key.token
    auth_token = access_key.auth_token
    { 'HTTP_AUTHORIZATION': basic_auth(token, auth_token) }
  end
  let(:products) { create_list(:product, 3, account: account) }

  before { products }

  describe 'GET /api/v1/products' do
    context 'when retrieving all products' do
      before { get '/api/v1/products', headers: headers }

      it 'returns list of products' do
        expect(json['products'].count).to eq(3)
      end
    end

    context 'when using ids' do
      it 'retrieves products by id' do
        get '/api/v1/products',
            params: { ids: [products[0].id, products[1].id] },
            headers: headers
        expect(json['products'].count).to eq(2)
      end
    end

    context 'when using since_id' do
      it 'returns list of products' do
        get '/api/v1/products',
            params: { since_id: products[1].id },
            headers: headers
        expect(json['products'].count).to eq(1)
      end
    end

    context 'when using created_at_min' do
      it 'returns list of products' do
        # TODO: test this using past date
        Timecop.freeze(Time.current + 1.day)
        product1 = create(:product, account: account)
        Timecop.return
        Timecop.freeze(Time.current + 2.days)
        create(:product, account: account)
        Timecop.return
        get '/api/v1/products',
            params: { created_at_min: product1.created_at },
            headers: headers
        expect(json['products'].count).to eq(2)
      end
    end

    context 'when using created_at_max' do
      it 'returns list of products' do
        # TODO: test this using past date
        Timecop.freeze(Time.current - 1.day)
        product1 = create(:product, account: account)
        Timecop.return
        Timecop.freeze(Time.current - 2.days)
        create(:product, account: account)
        Timecop.return
        get '/api/v1/products',
            params: { created_at_max: product1.created_at + 1.second },
            headers: headers
        expect(json['products'].count).to eq(2)
      end
    end
  end

  describe 'GET /api/v1/products/count' do
    it 'counts products' do
      get '/api/v1/products/count', headers: headers
      expect(response).to have_http_status(:ok)
      expect(json).to include_json(count: 3)
    end
  end

  describe 'GET /api/v1/products/:id' do
    context 'with existing product' do
      it 'returns the product' do
        get "/api/v1/products/#{product.id}", headers: headers
        expect(json).to include_json(product: {})
        expect(json).to include_json(product: { variants: [] })
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with a non-existent product' do
      it 'returns the 404' do
        get '/api/v1/products/0', headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end

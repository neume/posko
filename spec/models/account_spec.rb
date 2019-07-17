require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) do
    create(:account,
           name: 'first_company',
           company: 'First Company')
  end

  describe 'Account creation' do
    it 'creates new account' do
      account = Account.create name: 'first_company', company: 'First Company'
      expect(account).to be_truthy
    end
  end

  describe 'associations' do
    it { is_expected.to have_one(:account_setting) }
    it { is_expected.to have_many(:products) }
    it { is_expected.to have_many(:variants).through(:products) }
    it { is_expected.to have_many(:invoices) }
    it { is_expected.to have_many(:invoice_lines).through(:invoices) }
    it { is_expected.to have_many(:customers) }
    it { is_expected.to have_many(:roles) }
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:categories) }
    it { is_expected.to have_many(:option_types) }
    it { is_expected.to have_many(:option_values).through(:option_types) }
  end
end

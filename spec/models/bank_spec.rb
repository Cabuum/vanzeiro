require 'rails_helper'

RSpec.describe Bank, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:accounts).class_name('BankAccount') }
  end

  context 'table fields' do
    it {
      is_expected.to have_db_column(:full_name).of_type(:string)
      .with_options(limit: 30)
    }
    it {
      is_expected.to have_db_column(:name).of_type(:string)
      .with_options(limit: 10)
    }
  end

  context 'factories' do
    it { expect(build(:bank)).to be_valid }
    it { expect(build(:invalid_bank)).to_not be_valid }
  end
end

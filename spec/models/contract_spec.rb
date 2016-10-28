require 'rails_helper'

RSpec.describe Contract, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:bank_account) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:passenger) }

    it { is_expected.to have_many(:installments).dependent(:destroy) }
  end

  context 'model validations'

  context 'table fields' do
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:passenger_id).of_type(:integer) }
    it { is_expected.to have_db_column(:bank_account_id).of_type(:integer) }

    it { is_expected.to have_db_column(:closing_date).of_type(:date) }
    it { is_expected.to have_db_column(:start).of_type(:date) }

    it do
      is_expected.to have_db_column(:interest).of_type(:decimal)
        .with_options(precision: 5, scale: 2)
    end

    it do
      is_expected.to have_db_column(:value).of_type(:decimal)
        .with_options(precision: 10, scale: 2)
    end

    it { is_expected.to have_db_column(:is_alive).of_type(:boolean) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:passenger_id) }
    it { is_expected.to have_db_index(:bank_account_id) }
  end

  context 'factories' do
    # it { expect(build(:user)).to be_valid }
    # it { expect(build(:invalid_user)).to_not be_valid }
  end

  context 'scopes' do
    describe '.active' do
      it 'need to return only active rows'
    end
  end
end

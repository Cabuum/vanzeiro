require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:bank) }
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:contracts).dependent(:destroy) }
  end

  context 'model validations'

  context 'table fields' do
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:bank_id).of_type(:integer) }

    it { is_expected.to have_db_column(:agency).of_type(:string) }
    it { is_expected.to have_db_column(:account).of_type(:string) }
    it { is_expected.to have_db_column(:agreement).of_type(:string) }
    it { is_expected.to have_db_column(:instruction1).of_type(:string) }
    it { is_expected.to have_db_column(:instruction2).of_type(:string) }
    it { is_expected.to have_db_column(:instruction3).of_type(:string) }
    it { is_expected.to have_db_column(:instruction4).of_type(:string) }
    it { is_expected.to have_db_column(:instruction5).of_type(:string) }
    it { is_expected.to have_db_column(:instruction6).of_type(:string) }
    it { is_expected.to have_db_column(:instruction7).of_type(:string) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:bank_id) }
  end

  context 'factories' do
    it { expect(build(:bank_account)).to be_valid }
    it { expect(build(:invalid_bank_account)).to_not be_valid }
  end
end

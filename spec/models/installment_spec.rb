require 'rails_helper'

RSpec.describe Installment, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:contract) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:contract_id).of_type(:integer) }
    it { is_expected.to have_db_column(:due_date).of_type(:date) }
    it { is_expected.to have_db_column(:paid).of_type(:boolean) }
    it { is_expected.to have_db_column(:payment_date).of_type(:date) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:contract_id) }
  end

  context 'factories' do
    it { expect(build(:event)).to be_valid }
    it { expect(build(:invalid_event)).to_not be_valid }
  end
end

require 'rails_helper'

RSpec.describe Authorization, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_length_of(:username).is_at_most(40) }
    it { is_expected.to validate_length_of(:provider).is_at_most(20) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:uid).of_type(:string) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }

    it { is_expected.to have_db_column(:token).of_type(:string) }
    it { is_expected.to have_db_column(:secret).of_type(:string) }

    it do
      is_expected.to have_db_column(:provider).of_type(:string)
        .with_options(limit: 20)
    end

    it do
      is_expected.to have_db_column(:username).of_type(:string)
        .with_options(limit: 40)
    end
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:user_id) }
  end

  context 'factories' do
    it { expect(build(:authorization)).to be_valid }
    it { expect(build(:invalid_authorization)).to_not be_valid }
  end
end

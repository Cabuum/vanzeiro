require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:authorizations) }
    it { is_expected.to have_many(:accounts) }
    it { is_expected.to have_one(:configuration).class_name(MyConfiguration) }
  end

  context 'model validations' do
    # it { is_expected.to validate_presence_of(:email) }
    # it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    # it { is_expected.to validate_presence_of(:role) }
    # it { is_expected.to validate_presence_of(:profile) }

    # it { is_expected.to validate_presence_of(:status) }
    # it { is_expected.to validate_inclusion_of(:status).in_array(CommonStatus.list) }
  end

  context 'table fields' do
    # it { is_expected.to have_db_column(:email).of_type(:string) }

    # it { is_expected.to have_db_column(:status).of_type(:integer) }
    # it { is_expected.to have_db_column(:role_id).of_type(:integer) }
    # it { is_expected.to have_db_column(:profile_id).of_type(:integer) }

    # it { is_expected.to have_db_column(:is_admin).of_type(:boolean) }
  end

  context 'table indexes' do
    # it { is_expected.to have_db_index(:email) }
  end

  context 'factories' do
    # it { expect(build(:user)).to be_valid }
    # it { expect(build(:invalid_user)).to_not be_valid }
  end

  context 'scopes'
end

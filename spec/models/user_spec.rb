require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:authorizations) }
    it { is_expected.to have_many(:bank_accounts) }
    it { is_expected.to have_one(:setting).class_name(Setting) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    # it { is_expected.to validate_presence_of(:role) }
    # it { is_expected.to validate_presence_of(:profile) }

    # it { is_expected.to validate_presence_of(:status) }
    # it { is_expected.to validate_inclusion_of(:status).in_array(CommonStatus.list) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }

    # it { is_expected.to have_db_column(:status).of_type(:integer) }
    # it { is_expected.to have_db_column(:role_id).of_type(:integer) }
    # it { is_expected.to have_db_column(:profile_id).of_type(:integer) }

    # it { is_expected.to have_db_column(:is_admin).of_type(:boolean) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:email) }
    it { is_expected.to have_db_index(:reset_password_token) }
  end

  context 'factories' do
    # it { expect(build(:user)).to be_valid }
    # it { expect(build(:invalid_user)).to_not be_valid }
  end

  context 'scopes'

  context 'activerecord callbacks' do
    context 'create callbacks' do
      subject { User.new._create_callbacks.map(&:filter) }

      it { is_expected.to include(:generate_settings) }
    end

    describe '#generate_settings' do
      it 'after creating a user generate a new config' do
        expect do
          User.create(password: '12345678', email: 'ahorsewithno@name.com')
        end.to change(Setting, :count).by(1)
      end
    end
  end
end

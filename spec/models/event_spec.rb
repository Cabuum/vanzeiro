require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'table fields' do
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }

    it {
      is_expected.to have_db_column(:title).of_type(:string)
        .with_options(limit: 180)
    }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:start_time).of_type(:datetime) }
    it { is_expected.to have_db_column(:end_time).of_type(:datetime) }
  end

  context 'table indexes' do
    it { is_expected.to have_db_index(:user_id) }
  end

  context 'factories' do
    it { expect(build(:event)).to be_valid }
    it { expect(build(:invalid_event)).to_not be_valid }
  end
end

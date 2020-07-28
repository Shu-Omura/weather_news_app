require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validation' do
    subject { city }

    describe 'factory' do
      let(:city) { build(:city) }
      it { is_expected.to be_valid }
    end

    describe 'about name' do
      let(:city) { build(:city, name: nil) }
      it { is_expected.not_to be_valid}
    end

    describe 'about romaji' do
      let(:city) { build(:city, romaji: nil) }
      it { is_expected.not_to be_valid}
    end

    describe 'about location_id' do
      let(:city) { build(:city, location_id: nil) }
      it { is_expected.not_to be_valid}
    end
  end
end

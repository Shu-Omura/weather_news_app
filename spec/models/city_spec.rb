require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validation' do
    describe 'factory' do
      let(:city) { build(:city) }
      it 'is valid' do
        expect(city).to be_valid
      end
    end

    describe 'about name' do
      let(:city_2) { build(:city, name: nil) }
      it 'is invalid without name' do
        expect(city_2).not_to be_valid
      end
    end

    describe 'about romaji' do
      let(:city_3) { build(:city, romaji: nil) }
      it 'is invalid without romaji' do
        expect(city_3).not_to be_valid
      end
    end

    describe 'about location_id' do
      let(:city_4) { build(:city, location_id: nil) }
      it 'is invalid without location_id' do
        expect(city_4).not_to be_valid
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Statistic, type: :model do
  describe 'validation' do
    describe 'about factory' do
      let(:statistic) { build(:statistic) }

      it 'is valid' do
        expect(statistic).to be_valid
      end
    end

    describe 'date' do
      let(:statistic) { build(:statistic, date: nil) }

      it 'is not valid' do
        expect(statistic).not_to be_valid
      end
    end
  end
end

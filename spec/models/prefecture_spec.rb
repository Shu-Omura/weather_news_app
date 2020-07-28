require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  let(:prefecture) { build(:prefecture, name: name) }

  describe 'validation' do
    subject { prefecture }

    context 'with name' do
      let(:name) { '大阪府' }

      it { is_expected.to be_valid }
    end

    context 'without name' do
      let(:name) { nil }

      it { is_expected.not_to be_valid }
    end
  end
end

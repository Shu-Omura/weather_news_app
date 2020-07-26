require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  let!(:city) { create(:city, prefecture: prefecture) }
  let(:prefecture) { create(:prefecture) }

  describe 'GET #index' do
    before { get prefecture_cities_path(prefecture) }

    it 'returns http 200' do
      expect(response).to have_http_status(200)
    end

    it 'shows prefecture and cities names' do
      expect(response.body).to include prefecture.name
      expect(response.body).to include city.name
    end
  end
end

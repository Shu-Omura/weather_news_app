require 'rails_helper'

RSpec.describe 'Prefectures', type: :request do
  let!(:prefecture) { create(:prefecture) }

  describe 'GET #index' do
    before { get root_path }

    it 'returns http 200' do
      expect(response).to have_http_status(200)
    end

    it 'shows prefectures names' do
      expect(response.body).to include prefecture.name
    end
  end
end

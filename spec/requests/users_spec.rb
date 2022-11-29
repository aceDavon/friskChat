require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /show,' do
    it 'returns http success' do
      get '/users/,'
      expect(response).to have_http_status(:success)
    end

    it 'return homw views template' do
      get '/'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /index]' do
    before :each do
      get '/users/:id'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'return the show views template' do
      expect(response).to render_template(:show)
    end
  end
end

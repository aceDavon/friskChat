require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users/:user_id/posts'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/:user_id/posts/:id'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the show template' do
      expect(response).to render_template(:show)
    end
  end
end

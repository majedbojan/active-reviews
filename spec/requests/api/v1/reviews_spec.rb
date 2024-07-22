require 'rails_helper'

RSpec.describe 'Api::V1::Reviews', type: :request do
  let!(:movie) { create(:movie) }
  let!(:reviews) { create_list(:review, 5, movie: movie) }
  let(:review) { reviews.first }

  describe 'GET /api/v1/reviews' do
    before { get '/api/v1/reviews' }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of reviews' do
      json = JSON.parse(response.body)
      expect(json['data'].size).to eq(5)
    end

    it 'returns reviews serialized with ReviewSerializer' do
      json = JSON.parse(response.body)
      expect(json['data'].first['attributes'].keys).to include(
        'review',
        'stars',
        'user'
      )
    end
  end

  describe 'GET /api/v1/reviews/:id' do
    before do
      get "/api/v1/reviews/#{review.id}"
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the review serialized with ReviewSerializer' do
      json = JSON.parse(response.body)
      expect(json['data']['attributes'].keys).to include(
        'review',
        'stars',
        'user'
      )
    end
  end
end

require 'rails_helper'

RSpec.describe 'Api::V1::Movies', type: :request do
  let!(:movies) { create_list(:movie, 5) }

  describe 'GET /api/v1/movies' do
    before { get '/api/v1/movies' }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of movies' do
      json = JSON.parse(response.body)
      expect(json['data'].size).to eq(5)
    end

    it 'returns movies serialized with MovieSerializer' do
      json = JSON.parse(response.body)
      expect(json['data'].first['attributes']).to include(
        'name',
        'actor',
        'country',
        'description',
        'director',
        'filming_location',
        'year'
      )
    end
  end

  describe 'GET /api/v1/movies?actor=...' do
    let!(:actor_movie) { create(:movie, actor: 'Specific Actor') }

    before { get "/api/v1/movies?actor=#{actor_movie.actor}" }

    it 'returns movies filtered by actor' do
      json = JSON.parse(response.body)
      expect(json['data'].first['attributes']['actor']).to eq(actor_movie.actor)
    end
  end
end

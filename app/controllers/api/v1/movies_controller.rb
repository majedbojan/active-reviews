class Api::V1::MoviesController < ApplicationController
  include MovieQueryable

  def index
    @movies = fetch_movies
    render json: ::MovieSerializer.new(@movies).serializable_hash.to_json
  end
end

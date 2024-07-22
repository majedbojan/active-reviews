class MoviesController < ApplicationController
  include MovieQueryable

  def index
    @movies = fetch_movies
  end
end

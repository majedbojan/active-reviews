class MoviesController < ApplicationController
  def index
    if params[:actor].present?
      @movies = Movie.where("actor ILIKE ?", "%#{params[:actor]}%")
    else
      @movies = Movie.left_joins(:reviews).group(:id).order("AVG(reviews.stars) DESC")
    end
  end
end

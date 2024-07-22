class ReviewsController < ApplicationController
  def index
    @movie          = Movie.find(params[:movie_id])
    @reviews        = @movie.reviews.order(stars: :desc)
    @review_counts  = @reviews.pluck(:stars).tally
    @average_rating = @reviews.average(:stars).to_f
  end
end

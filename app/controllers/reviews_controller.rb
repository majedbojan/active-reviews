class ReviewsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews.pluck(:stars)
    @review_counts = @reviews.tally
    @average_rating = @reviews.sum.to_f / @reviews.size
  end
end

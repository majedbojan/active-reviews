class Api::V1::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    render json: ReviewSerializer.new(@reviews).serializable_hash.to_json
  end

  def show
    @review = Review.find(params[:id])
    render json: ReviewSerializer.new(@review).serializable_hash.to_json
  end
end

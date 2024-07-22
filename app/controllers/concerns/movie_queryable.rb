# app/controllers/concerns/movie_query_concern.rb
module MovieQueryable
  extend ActiveSupport::Concern

  private

  def fetch_movies
    query = base_query

    if actor_filter_present?
      query = query.where("actor ILIKE ?", "%#{sanitize_actor(params[:actor])}%")
    end

    query
  end

  def base_query
    Movie.left_joins(:reviews)
         .group(:id)
         .order("AVG(reviews.stars) DESC")
  end

  def actor_filter_present?
    params[:actor].present?
  end

  def sanitize_actor(actor)
    actor.strip.gsub(/[^a-zA-Z0-9\s]/, "")
  end
end

# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  review     :text             not null
#  stars      :integer          not null
#  user       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint           not null
#
# Indexes
#
#  index_reviews_on_movie_id  (movie_id)
#  index_reviews_on_stars     (stars)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#
class Review < ApplicationRecord
  belongs_to :movie
end

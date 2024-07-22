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

  # Associations
  belongs_to :movie

  # Validations
  validates :review,   presence: true
  validates :user,     presence: true
  validates :movie_id, presence: true
  validates :stars,    presence: true, numericality: {
                                                        only_integer: true,
                                                        greater_than_or_equal_to: 1,
                                                        less_than_or_equal_to: 5
                                                     }

  validates :user, uniqueness: { scope: :movie_id, message: "can only review a movie once" }
end

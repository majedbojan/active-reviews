# == Schema Information
#
# Table name: movies
#
#  id               :bigint           not null, primary key
#  actor            :string           not null
#  country          :string           not null
#  description      :text             not null
#  director         :string           not null
#  filming_location :string           not null
#  name             :string           not null
#  year             :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_movies_on_actor  (actor)
#
class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name,             presence: true, length: { maximum: 255 }, uniqueness: true
  validates :description,      presence: true
  validates :director,         presence: true, length: { maximum: 255 }
  validates :actor,            presence: true, length: { maximum: 255 }
  validates :filming_location, presence: true, length: { maximum: 255 }
  validates :country,          presence: true, length: { maximum: 255 }
  validates :year,             presence: true, numericality: {
                                                                only_integer: true,
                                                                greater_than_or_equal_to: 1800,
                                                                less_than_or_equal_to: Date.current.year
                                                              }
end

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
FactoryBot.define do
  factory :movie do
    name { Faker::Movie.title }
    description { Faker::Lorem.paragraph }
    director { Faker::Name.name }
    actor { Faker::Name.name }
    filming_location { Faker::Address.city }
    country { Faker::Address.country }
    year { Faker::Number.between(from: 1900, to: Date.current.year) }
  end
end

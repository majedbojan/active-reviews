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
    
  end
end

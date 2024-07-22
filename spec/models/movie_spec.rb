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
require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { create(:movie) }

  # Association
  it { should have_many(:reviews).dependent(:destroy) }

  # Validation
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(255) }

  it { should validate_presence_of(:description) }

  it { should validate_presence_of(:director) }
  it { should validate_length_of(:director).is_at_most(255) }

  it { should validate_presence_of(:actor) }
  it { should validate_length_of(:actor).is_at_most(255) }

  it { should validate_presence_of(:filming_location) }
  it { should validate_length_of(:filming_location).is_at_most(255) }

  it { should validate_presence_of(:country) }
  it { should validate_length_of(:country).is_at_most(255) }

  it { should validate_presence_of(:year) }
  it { should validate_numericality_of(:year).only_integer }
  it { should validate_numericality_of(:year).is_greater_than_or_equal_to(1800) }
  it { should validate_numericality_of(:year).is_less_than_or_equal_to(Date.current.year) }

  it 'is valid with valid attributes' do
    expect(movie).to be_valid
  end

  context 'when creating a duplicate movie' do
    before do
      create(:movie, name: 'Duplicate Movie')
    end

    it 'does not allow duplicate names' do
      duplicate_movie = build(:movie, name: 'Duplicate Movie')
      expect(duplicate_movie).not_to be_valid
      expect(duplicate_movie.errors[:name]).to include('has already been taken')
    end
  end
end

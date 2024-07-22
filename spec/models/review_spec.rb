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

require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:movie) { create(:movie) }
  let(:review) { create(:review, movie: movie) }

  # Association
  it { should belong_to(:movie) }

  # Validation
  it { should validate_presence_of(:review) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:movie_id) }
  it { should validate_presence_of(:stars) }

  it { should validate_numericality_of(:stars).only_integer }
  it { should validate_numericality_of(:stars).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:stars).is_less_than_or_equal_to(5) }

  it 'validates uniqueness of user scoped to movie_id' do
    create(:review, user: 'UniqueUser', movie: movie)
    review = build(:review, user: 'UniqueUser', movie: movie)
    expect(review).not_to be_valid
    expect(review.errors[:user]).to include('can only review a movie once')
  end

  it 'is valid with valid attributes' do
    expect(review).to be_valid
  end

  context 'when creating a review with invalid attributes' do
    it 'is invalid without a review text' do
      invalid_review = build(:review, review: nil)
      expect(invalid_review).not_to be_valid
      expect(invalid_review.errors[:review]).to include("can't be blank")
    end

    it 'is invalid without a user' do
      invalid_review = build(:review, user: nil)
      expect(invalid_review).not_to be_valid
      expect(invalid_review.errors[:user]).to include("can't be blank")
    end

    it 'is invalid without a movie_id' do
      invalid_review = build(:review, movie_id: nil)
      expect(invalid_review).not_to be_valid
      expect(invalid_review.errors[:movie_id]).to include("can't be blank")
    end

    it 'is invalid with stars less than 1' do
      invalid_review = build(:review, stars: 0)
      expect(invalid_review).not_to be_valid
      expect(invalid_review.errors[:stars]).to include("must be greater than or equal to 1")
    end

    it 'is invalid with stars greater than 5' do
      invalid_review = build(:review, stars: 6)
      expect(invalid_review).not_to be_valid
      expect(invalid_review.errors[:stars]).to include("must be less than or equal to 5")
    end
  end

  context 'when creating a duplicate review for the same movie by the same user' do
    before do
      create(:review, user: 'UniqueUser', movie: movie)
    end

    it 'does not allow duplicate reviews by the same user for the same movie' do
      duplicate_review = build(:review, user: 'UniqueUser', movie: movie)
      expect(duplicate_review).not_to be_valid
      expect(duplicate_review.errors[:user]).to include('can only review a movie once')
    end
  end
end

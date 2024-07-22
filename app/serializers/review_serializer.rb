class ReviewSerializer
  include JSONAPI::Serializer
  attributes :review, :stars, :user

  belongs_to :movie
end

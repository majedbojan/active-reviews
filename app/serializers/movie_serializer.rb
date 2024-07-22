class MovieSerializer
  include JSONAPI::Serializer
  attributes :name, :actor, :country, :description, :director, :filming_location, :year
end

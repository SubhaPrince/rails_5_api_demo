class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name
  # has_many :topics
end

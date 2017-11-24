class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :age
  # has_many :topics
end

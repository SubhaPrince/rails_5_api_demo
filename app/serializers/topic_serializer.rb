class TopicSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  # has_many :users
end
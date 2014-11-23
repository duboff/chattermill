class TextSerializer < ActiveModel::Serializer
  attributes :id, :body

  has_many :themes
  has_one :project
end

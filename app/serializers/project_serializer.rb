class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :body

  belongs_to :company

  # has_many :users, root: false
end

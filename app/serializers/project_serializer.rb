class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :body

  has_one :company
end

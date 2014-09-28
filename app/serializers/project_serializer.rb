class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :body

  belongs_to :company
end

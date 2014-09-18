class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :website, :plan_id

  # has_many :users, root: false
end

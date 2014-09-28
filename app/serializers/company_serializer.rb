class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :website, :plan_id

  has_many :users
  has_many :projects
end

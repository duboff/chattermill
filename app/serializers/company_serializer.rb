class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :website

  has_many :users
end

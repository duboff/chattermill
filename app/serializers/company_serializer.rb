class CompanySerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :name, :website

  has_many :users
end

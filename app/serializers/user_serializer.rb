class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email

  belongs_to :company

  
end

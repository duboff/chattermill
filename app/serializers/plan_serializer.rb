class PlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :currency, :amount, :limit, :interval
end
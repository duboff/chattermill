class ConverPlanIdToString < ActiveRecord::Migration
  def change
    change_column :companies, :plan_id, :string
  end
end

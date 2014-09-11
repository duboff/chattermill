class AddCompanyToPlan < ActiveRecord::Migration
  def change
    add_reference :plans, :company, index: true
  end
end

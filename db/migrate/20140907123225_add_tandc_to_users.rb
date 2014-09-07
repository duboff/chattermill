class AddTandcToUsers < ActiveRecord::Migration
  def change
    add_column :users, :t_and_c, :boolean
  end
end

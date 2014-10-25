class AddTextIdToThemes < ActiveRecord::Migration
  def change
    add_reference :themes, :text, index: true
  end
end

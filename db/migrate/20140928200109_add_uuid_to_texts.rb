class AddUuidToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :uuid, :string
  end
end

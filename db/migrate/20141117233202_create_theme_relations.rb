class CreateThemeRelations < ActiveRecord::Migration
  def change
    create_table :theme_relations do |t|
      t.belongs_to :theme, index: true
      t.belongs_to :text, index: true

      t.timestamps
    end
  end
end

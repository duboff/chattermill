class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :body
      t.float :sentiment_score
      t.string :sentiment_polarity
      t.timestamps
    end
  end
end

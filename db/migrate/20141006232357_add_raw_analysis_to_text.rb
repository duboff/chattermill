class AddRawAnalysisToText < ActiveRecord::Migration
  def change
    add_column :texts, :raw_analysis, :json
  end
end

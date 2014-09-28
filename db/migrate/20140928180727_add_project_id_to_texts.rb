class AddProjectIdToTexts < ActiveRecord::Migration
  def change
    add_reference :texts, :project, index: true
  end
end

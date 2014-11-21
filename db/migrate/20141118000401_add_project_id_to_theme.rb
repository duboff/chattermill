class AddProjectIdToTheme < ActiveRecord::Migration
  def change
    add_reference :themes, :project, index: true
  end
end

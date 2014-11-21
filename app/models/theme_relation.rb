class ThemeRelation < ActiveRecord::Base
  belongs_to :theme
  belongs_to :text
end

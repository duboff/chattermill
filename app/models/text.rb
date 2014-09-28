class Text < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :body
end

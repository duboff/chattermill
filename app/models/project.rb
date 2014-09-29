class Project < ActiveRecord::Base
  belongs_to :company
  has_many :texts

  validates_presence_of :name, :body

  after_create :create_texts

  def create_texts
    body.split("\n").each do |para|
      Text.create(body: para, uuid: SecureRandom.uuid, project_id: self.id)
    end
  end
end

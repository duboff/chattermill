class Project < ActiveRecord::Base
  belongs_to :company
  has_many :texts
  has_many :themes

  validates_presence_of :name, :body, :company_id

  after_create :create_texts

  private

  def create_texts
    body.split("\n").each do |para|
      Text.create(body: para, uuid: SecureRandom.uuid, project_id: id)
    end
  end
end

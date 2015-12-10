class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_attached_file :screenshot
  validates_attachment :screenshot, content_type: { content_type: ['image/jpg', 'image/jpeg'] }
end

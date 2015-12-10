class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :github_address, presence: true
end

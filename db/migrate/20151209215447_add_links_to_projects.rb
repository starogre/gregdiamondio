class AddLinksToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :github_address, :string
    add_column :projects, :website_address, :string
  end
end

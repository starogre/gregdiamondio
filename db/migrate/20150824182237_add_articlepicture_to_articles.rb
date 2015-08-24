class AddArticlepictureToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :articlepicture, :string
  end
end

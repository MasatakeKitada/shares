class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_image, :text
  end
end

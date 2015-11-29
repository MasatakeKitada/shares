class CreateUsersPages < ActiveRecord::Migration
  def change
    create_table :users_pages do |t|
      t.integer :user_id
      t.integer :page_id
      t.timestamps
    end
  end
end

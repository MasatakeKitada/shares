class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url
      t.text :title
      t.text :image_url
      t.integer :group_id
      t.timestamps
    end
  end
end

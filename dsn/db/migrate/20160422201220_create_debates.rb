class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|

      t.string :title
      t.text :overview
      t.string :status
      t.string :image_url
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_id,   null:false 
      t.integer :book_id,   null:false 
      t.text :text,         null:false 

      t.timestamps
    end
  end
end

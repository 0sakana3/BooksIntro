class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title,            null:false 
      t.text  :publisher,         null:false
      t.integer  :genre_id,       null:false
      t.text :detail,             null:false 
      t.text :recommended,        null:false 
      t.text :url,                null:false 
      t.references :user,         null:false, foreign_key: true   
      t.timestamps
    end
  end
end

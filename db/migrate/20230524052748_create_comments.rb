class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      
      t.string :content
      t.string :commentable_id
      t.string :commentable_type
      t.timestamps
    end
  end
end

class CreateMagazines < ActiveRecord::Migration[6.1]
  def change
    create_table :magazines do |t|
      t.string :title
      t.string :discription
      t.string :user_id

      t.timestamps
    end
  end
end

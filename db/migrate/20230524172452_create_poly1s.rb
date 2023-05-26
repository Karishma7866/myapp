class CreatePoly1s < ActiveRecord::Migration[6.1]
  def change
    create_table :poly1s do |t|
      t.string :poly1_title
      t.string :description
      t.timestamps
    end
  end
end

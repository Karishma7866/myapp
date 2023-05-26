class CreatePoly3s < ActiveRecord::Migration[6.1]
  def change
    create_table :poly3s do |t|
      t.string :poly3_title
      t.string :description
      t.timestamps
    end
  end
end

class CreatePoly2s < ActiveRecord::Migration[6.1]
  def change
    create_table :poly2s do |t|
      t.string :poly2_title
      t.string :description


      t.timestamps
    end
  end
end

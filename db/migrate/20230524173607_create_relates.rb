class CreateRelates < ActiveRecord::Migration[6.1]
  def change
    create_table :relates do |t|
      t.string :content
      t.string :relatable_id
      t.string :relatable_type
      t.timestamps
    end
  end
end

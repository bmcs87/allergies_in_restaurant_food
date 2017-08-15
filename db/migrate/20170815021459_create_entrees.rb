class CreateEntrees < ActiveRecord::Migration
  def change
    create_table :entrees do |t|
      t.string :name
      t.integer :allergens_id
      t.integer :restaurants_id

      t.timestamps

    end
  end
end

class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :entrees_id
      t.integer :allergens_id

      t.timestamps

    end
  end
end

class CreateAllergens < ActiveRecord::Migration
  def change
    create_table :allergens do |t|
      t.string :name
      t.string :reaction
      t.integer :restaurants_id
      t.integer :user_id

      t.timestamps

    end
  end
end

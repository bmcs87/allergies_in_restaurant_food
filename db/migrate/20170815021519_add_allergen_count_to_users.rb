class AddAllergenCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :allergens_count, :integer
  end
end

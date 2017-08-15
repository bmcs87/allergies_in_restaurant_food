class Entree < ApplicationRecord
  # Direct associations

  belongs_to :restaurants,
             :class_name => "Restaurant"

  belongs_to :allergens,
             :class_name => "Allergen"

  # Indirect associations

  # Validations

end

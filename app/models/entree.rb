class Entree < ApplicationRecord
  # Direct associations

  belongs_to :allergens,
             :class_name => "Allergen"

  # Indirect associations

  # Validations

end

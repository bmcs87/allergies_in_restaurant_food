class Allergen < ApplicationRecord
  # Direct associations

  has_many   :cuisines,
             :class_name => "Entree",
             :foreign_key => "allergens_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end

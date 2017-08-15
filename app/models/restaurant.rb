class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :cuisines,
             :class_name => "Entree",
             :foreign_key => "restaurants_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :dishes,
             :through => :cuisines,
             :source => :cuisines

  has_many   :allergens,
             :through => :cuisines,
             :source => :allergens

  # Validations

end

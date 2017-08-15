class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :cuisines,
             :class_name => "Entree",
             :foreign_key => "restaurants_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end

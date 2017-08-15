class Allergen < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  has_many   :cuisines,
             :class_name => "Entree",
             :foreign_key => "allergens_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end

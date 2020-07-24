class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true 
  # no puede haber 2 dosis uniqueness: true validations scope
  # validates_uniqueness_of :cocktail_id, :ingredient_id, scope: %i[cocktail ingredient]
  validates :ingredient_id, uniqueness: { scope: :cocktail_id }
end

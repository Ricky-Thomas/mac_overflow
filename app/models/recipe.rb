class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many   :ingredients
  has_many   :instructions

  def parse_ingredients!(ingredients_str)
   ingredients_str.split(',').map(&:strip).uniq.each do |ingredient_str|
   ingredient = Ingredient.where(name: ingredient_str).first_or_create
   self.ingredients << ingredient
   end
  end
end
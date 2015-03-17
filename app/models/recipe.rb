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

  def parse_instructions!(instructions_str)
   instructions_str.split(',').map(&:strip).uniq.each do |instruction_str|
   instruction = Instruction.where(description: instruction_str).first_or_create
   self.instructions << instruction
   end
  end

end
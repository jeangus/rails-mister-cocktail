class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :cocktails, through: :doses
  has_many :doses

  # INGREDIENTS = []
  # Ingredient.all.each do |ingredient|
  #   a = []
  #   a << ingredient.name
  #   a << ingredient.id
  #   INGREDIENTS << a
  # end


end



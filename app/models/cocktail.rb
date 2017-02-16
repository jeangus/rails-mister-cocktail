class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :ingredients, dependent: :destroy, through: :doses
  has_many :doses
end

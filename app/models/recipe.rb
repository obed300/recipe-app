class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, foreign_key: :recipe_id
  has_many :foods

  has_many :foods, through: :recipe_foods
end

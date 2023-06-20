class Recipe < ApplicationRecord
  has_many :recipe_food, foreign_key: :recipe_id
  belongs_to :user, class_name: 'User'
end

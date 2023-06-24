class Food < ApplicationRecord
  has_many :recipe_food, foreign_key: :food_id
  belongs_to :user, class_name: 'User'
end

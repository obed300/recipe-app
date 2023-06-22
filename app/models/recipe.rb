class Recipe < ApplicationRecord
  has_many :recipe_foods, foreign_key: :recipe_id
  belongs_to :user, class_name: 'User'

  # Association
  #   belongs_to :user
  #   has_many :recipe_foods, dependent: :destroy
  #   has_many :foods, through: :recipe_foods
end

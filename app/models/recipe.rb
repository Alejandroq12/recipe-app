class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, :description, :preparation_time, :cooking_time, presence:true
  validates :preparation_time, :cooking_time, numericality:{greater_than_or_equal_to: 0}
  validates :name, uniqueness: true
end

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  scope :recent_public, -> { where(public: true).order(created_at: :desc) }

  validates :name, :description, :preparation_time, :cooking_time, presence: true
  validates :preparation_time, :cooking_time, numericality: { greater_than_or_equal_to: 0 }
  validates :name, uniqueness: true
end

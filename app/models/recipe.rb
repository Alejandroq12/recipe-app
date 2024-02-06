class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  scope :recent_public, -> { where(public: true).order(created_at: :desc) }
end

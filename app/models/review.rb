class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, length: { minimum: 20 }
  validates :rating, presence: true
end

class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true },
                     inclusion: { only_integer: true, in: [0, 1, 2, 3, 4, 5] }
end

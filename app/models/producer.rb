class Producer < ApplicationRecord
  has_one_attached :image
  has_many :movies
end

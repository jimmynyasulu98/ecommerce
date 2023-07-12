class Actor < ApplicationRecord
  has_one_attached :image
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  validates :name, presence: true
end

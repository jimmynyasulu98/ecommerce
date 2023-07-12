class Movie < ApplicationRecord

  has_one_attached :image
  belongs_to :producer
  belongs_to :category
  has_many :movie_actors
  has_many :actors, through: :movie_actors
end

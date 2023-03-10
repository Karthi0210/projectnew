class Genre < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
  has_many :book_genres
  has_many :books, through: :book_genres
end
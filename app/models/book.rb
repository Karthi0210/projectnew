class Book < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true , length: { minimum: 5 , maximum: 500}

  belongs_to :author
  validates :author_id, presence: true
  default_scope -> { order(updated_at: :desc) }
  has_many :book_genres
  has_many :genres, through: :book_genres
  

end
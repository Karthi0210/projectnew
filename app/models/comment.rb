class Comment < ApplicationRecord
  validates :description, presence: true, length: { minimum: 4, maximum: 140 }
  belongs_to :author
  belongs_to :book 
  validates :author_id, presence: true
  validates :book_id, presence: true
  default_scope -> { order(updated_at: :desc)}
end
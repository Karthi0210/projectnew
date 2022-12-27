class Message < ApplicationRecord
  belongs_to :author
  validates :content, presence: true
  validates :author_id, presence: true

  def self.most_recent
    order(:created_at).last(20)
  end
end
class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :text, presence: true, length: { maximum: 140 }
end

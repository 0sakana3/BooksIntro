class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to  :user
  has_one_attached  :image

  belongs_to :genre

  validates :title, presence: true, length: { in: 1..40 }
  validates :publisher, presence: true, length: { in: 1..30 }
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :detail , presence: true, length: { in: 1..1000 }
  validates :recommended, presence: true, length: { in: 1..1000 }
  validates :reference, presence: true

end

class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to  :user
  has_one_attached  :image

  belongs_to :genre

  validates :title, presence: true
  validates :publisher, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :detail , presence: true
  validates :recommended, presence: true
  validates :reference, presence: true

end

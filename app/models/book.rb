class Book < ApplicationRecord
  belongs_to  :user
  has_one_attached  :image

  validates :title, presence: true
  validates :publisher, presence: true
  validates :detail , presence: true
  validates :recommended, presence: true
  validates :url, presence: true
end

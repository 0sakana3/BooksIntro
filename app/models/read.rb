class Read < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validate :cannot_read_own_book
  validates :user_id, uniqueness: { scope: :book_id, message: 'has already read this book' }

  private

  def cannot_read_own_book
    return unless book&.user_id == user_id

    errors.add(:user, 'cannot mark your own book as read')
  end
end

class Read < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validate :cannot_read_own_book

private

  def cannot_read_own_book
    if book&.user_id == user_id
      errors.add(:user, "cannot mark your own book as read")
    end
  end
end

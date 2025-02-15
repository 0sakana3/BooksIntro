class Read < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def read_by?(user)
    reads.where(user_id: user.id).exists?
  end
end

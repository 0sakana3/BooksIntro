class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '雑誌' },
    { id: 3, name: 'コミック' },
    { id: 4, name: '文庫' },
    { id: 5, name: '新書' },
    { id: 6, name: '単行本（文芸書）' },
    { id: 7, name: '単行本（実用書）' },
    { id: 8, name: '単行本（専門書）' },
    { id: 9, name: '単行本（児童書・学習参考書）' }
  ]

  include ActiveHash::Associations
  has_many :books
end

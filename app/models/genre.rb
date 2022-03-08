class Genre < ActiveHash::Base
  self.data = [
    # { id: 1, name: '---' },
    { id: 2, name: 'オールジャンル' },
    { id: 3, name: 'ポップス' },
    { id: 4, name: 'ロック' },
    { id: 5, name: 'メタル' },
    { id: 6, name: 'ハード・コア' },
    { id: 7, name: 'パンク' },
    { id: 8, name: 'ブルース' },
    { id: 9, name: 'ジャズ' },
    { id: 10, name: 'ビジュアル系' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :bookings
  has_many :users
end

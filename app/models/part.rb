class Part < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ボーカル' },
    { id: 2, name: 'ギター' },
    { id: 3, name: 'ベース' },
    { id: 4, name: 'ドラム' },
    { id: 5, name: 'キーボード' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
end

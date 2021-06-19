class Prefecture < ActiveHash::Base
  self.data = [
  { id: 1, name: '--' },
  { id: 2, name: 'メンズ' },
  { id: 3, name: 'レディース' },
  { id: 4, name: 'キッズ' },
  { id: 5, name: '国際' },
  { id: 6, name: 'IT' },
  { id: 7, name: 'エンタメ' },
  { id: 8, name: 'スポーツ' },
  { id: 9, name: 'グルメ' },
  { id: 10, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :products
  end
  
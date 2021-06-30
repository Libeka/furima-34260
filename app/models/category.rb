class Category < ActiveHash::Base
  self.data = [
  { id: 1, name: '--' },
  { id: 2, name: 'メンズ' },
  { id: 3, name: 'レディース' },
  { id: 4, name: 'キッズ' }
  ]
  include ActiveHash::Associations
  has_many :products
  end
  
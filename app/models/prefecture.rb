lass Prefecture < ActiveHash::Base
self.data = [
{ id: 1, name: '--' },
{ id: 2, name: '東京' },
{ id: 3, name: '名古屋' },
{ id: 4, name: '大阪' },
{ id: 5, name: '福岡' }
]
include ActiveHash::Associations
has_many :products
end
class PurchaseRecord < ApplicationRecord
 

  belongs_to :user,optional: true
  belongs_to :product
  has_one :destination

end

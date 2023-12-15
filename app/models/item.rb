class Item < ApplicationRecord
  belongs_to :user
  #has_one :order
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days
end

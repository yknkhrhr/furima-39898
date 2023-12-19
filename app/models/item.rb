class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :detail
    validates :price
  end

  belongs_to :user
  #has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :fee_burden
  belongs_to :prefecture
  belongs_to :send_day

  extend ActiveHash::Associations::ActiveRecordExtensions
    with_options numericality: { othe_than:1, message: "can't be blank"} do
      validates :category_id
      validates :status_id
      validates :fee_burden_id
      validates :prefecture_id
      validates :send_day_id
    end

end

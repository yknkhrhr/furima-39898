class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :detail
  end
  validates :price,
    format: { with: /\A[0-9]+\z/},
    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}

  belongs_to :user
  #has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :fee_burden
    belongs_to :prefecture
    belongs_to :send_day
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :status_id
      validates :fee_burden_id
      validates :prefecture_id
      validates :send_day_id
    end

end

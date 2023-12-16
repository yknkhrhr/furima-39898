class Item < ApplicationRecord
  belongs_to :user
  #has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id,numericality: { othe_than: 1,  message: "can't be blank"}
  belongs_to :status
  validates :status_id,numericality: { othe_than: 1,  message: "can't be blank"}
  belongs_to :fee_burden
  validates :fee_burden_id,numericality: { othe_than: 1,  message: "can't be blank"}
  belongs_to :prefecture
  validates :prefecture_id,numericality: { othe_than: 1,  message: "can't be blank"}
  belongs_to :send_day
  validates :send_day_id,numericality: { othe_than: 1,  message: "can't be blank"}
  has_one_attached :image


end

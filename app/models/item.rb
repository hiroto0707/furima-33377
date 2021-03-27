class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  validates :name, presence: true 
  validates :description, presence: true
  validates :status_id, presence: true
  validates :category_id, presence: true
  validates :delivery_fee_id, presence: true 
  validates :area_id, presence: true 
  validates :day_id, presence: true
  validates :price, presence: true 
end
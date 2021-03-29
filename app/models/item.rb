class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day

  has_one_attached :image

 validates :name, presence: true 
 validates :description, presence: true
 validates :status_id, presence: true
 validates :category_id, presence: true
 validates :delivery_fee_id, presence: true
 validates :area_id, presence: true
 validates :day_id, presence: true
 validates :price, presence: true, numericality: { only_integer: true}
 validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 1000000, message: "is out of setting range" }
 validates :image, presence: true
end
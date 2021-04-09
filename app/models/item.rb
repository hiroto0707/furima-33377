class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day
  belongs_to :user
  has_one :order
  



  has_one_attached :image

  with_options presence: true do
   validates :name
   validates :description
   validates :status_id
   validates :category_id
   validates :delivery_fee_id
   validates :area_id
   validates :day_id
   validates :image
  end 

  with_options numericality: { other_than: 0 } do
   validates :status_id
   validates :category_id
   validates :delivery_fee_id
   validates :area_id
   validates :day_id
  end

 validates :price, presence: true, numericality: { only_integer: true}
 validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 1000000, message: "is out of setting range" }
end
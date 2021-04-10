class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :place

  validates :token, presence: true
  attr_accessor :token
end
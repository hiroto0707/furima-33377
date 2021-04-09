class UserDonation
  include ActiveModel::Model
  attr_accessor :area_id,:municipalities,:address,:building_number,:postal_code,:phone_number,:user_id,:item_id,:order_id

   validates :area_id,numericality: { other_than: 0 }
   validates :municipalities,presence: true
   validates :address,presence: true
   validates :postal_code,presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
   validates :phone_number, presence: true, format: { with: /\A\d{11}\z/ }

   attr_accessor :token
  

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Place.create(municipalities: municipalities, address: address, building_number: building_number,postal_code: postal_code,phone_number: phone_number,area_id: area_id, order_id: order.id)
  end
end
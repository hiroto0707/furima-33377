class UserDonation
  include ActiveModel::Model
  attr_accessor :area_id,:municipalities,:address,:building_number,:postal_code,:phone_number

   validates :area_id,numericality: { other_than: 0 }
   validates :municipalities,presence: true
   validates :address,presence: true
   validates :postal_code,presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }

   with_options presence: true, format: { with: /\A\d{11}\z/ } do
    validates :building_number
    validates :phone_number
   end

  def save
    AreaId.create(area_id: area_id)
    Municipalities.create(municipalities: municipalities)
    Address.create(address: address)
    BuildingNumber.create(building_number: building_number)
    PostalCode.create(postal_code: postal_code)
    PhoneNumber.create(phone_number: phone_number)
    Order.create(user_id: user_id, item_id: item_id)
    Place.create(order_id: order_id)
  end
end
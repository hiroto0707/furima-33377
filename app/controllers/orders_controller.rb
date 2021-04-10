class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path and return
    end
    @order = UserDonation.new
    if @item.order.present?
      redirect_to root_path and return
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserDonation.new(donation_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
     render :index
    end
  end

  private
  def donation_params
    params.require(:user_donation).permit(:area_id, :municipalities, :address, :building_number, :postal_code, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id,],token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_c83f8417ade55a9b63cb3fe1" 
    Payjp::Charge.create(
    amount: @item.price,
    card: donation_params[:token],   
    currency: 'jpy'
    )
  end
end
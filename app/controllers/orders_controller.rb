class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @item = Item.find(params[:item_id])
    @order = UserDonation.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserDonation.new(donation_params)
    if @order.valid?
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
end

#4242424242424242
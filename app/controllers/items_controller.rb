class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
    @items =  Item.order("name DESC")
  end

  def new
    @item = Item.new
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
     render :new
    end
  end

 private
  def item_params
    params.require(:item).permit(:name, :description, :status_id, :category_id, :delivery_fee_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end
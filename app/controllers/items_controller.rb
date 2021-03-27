class ItemsController < ApplicationController
  before_action :authenticate_user! only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
  end

 private
 def item_params
  params.require(:item).permit(:name, :description, :status_id, :category_id, :delivery_fee_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
 end
end

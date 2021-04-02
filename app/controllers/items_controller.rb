class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

 def show
  @item = Item.find(params[:id])
 end

 def edit
 end


 private
  def item_params
    params.require(:item).permit(:name, :description, :status_id, :category_id, :delivery_fee_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end
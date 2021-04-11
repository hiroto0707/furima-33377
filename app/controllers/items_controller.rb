class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destroy]


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
 end

 def edit  
 end

 def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end  
 end

 def destroy
  @item.destroy
  redirect_to root_path
 end

 

 private
 def move_to_root_path 
  if @item.order.present? || current_user.id == @item.user_id
    redirect_to root_path and return
  end  
 end

 def set_item
  @item = Item.find(params[:id])
 end


  def item_params
    params.require(:item).permit(:name, :description, :status_id, :category_id, :delivery_fee_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end
class OrdersController < ApplicationController
  def index
    @order = Order.all
  end

  def create
  end
end

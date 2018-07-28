class OrdersController < ApplicationController
  def index; end

  def create
    @user = current_user
    @items = current_user.cart.cart_items
  end
end

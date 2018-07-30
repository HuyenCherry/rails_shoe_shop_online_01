class OrdersController < ApplicationController
  def create
    @user = current_user
    args = params[:event_ids]
    if args
      @items = CartItem.where("id IN (?)", args.map(&:to_i)).to_a
    else
      @items = current_user.cart.cart_items
    end
  end
end

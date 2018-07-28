class BillsController < ApplicationController
  def create
    @user = current_user
    @cart = current_user.cart
    payment_type = params[:user][:payment_type] == t("in_person") ? 0 : 1
    Order.create address: params[:user][:address], status: false,
      payment_type: payment_type, cart_id: @cart.id
    @items = current_user.cart.cart_items
    @items.each(&:destroy)
    flash[:info] = t "order_success"
    redirect_to root_url
  end
end

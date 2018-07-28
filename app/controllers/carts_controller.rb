class CartsController < ApplicationController
  before_action :logged_in_user

  def index
    @items = current_user.cart ? current_user.cart.cart_items : CartItem.none
  end

  def edit; end

  def update
    @cart = Cart.find_or_create_by user: current_user
    @shoe = Shoe.find_by id: params[:id]
    cart_item = @cart.cart_items.find_by shoe: @shoe
    if params[:shoe][:quantity].to_i <= @shoe.quantity
      if cart_item
        cart_item.update quantity:
          (cart_item.quantity + params[:shoe][:quantity].to_i)
      else
        CartItem.create quantity:
          params[:shoe][:quantity], cart: @cart, shoe: @shoe
      end
      @shoe.update quantity: (@shoe.quantity - params[:shoe][:quantity].to_i)
    else
      flash[:danger] = t "out_of_stock"
    end
    redirect_to root_path
  end
end

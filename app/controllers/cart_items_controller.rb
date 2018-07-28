class CartItemsController < ApplicationController
  def create; end

  def update
    byebug
    notice = t "add_success"
    cart_item = CartItem.find_by id: params[:id]
    @shoe = cart_item.shoe
    if params[:item][:quantity].to_i <= @shoe.quantity
      cart_item.update quantity:
        (cart_item.quantity + params[:item][:quantity].to_i)
      @shoe.update quantity: (@shoe.quantity - params[:item][:quantity].to_i)
    else
      notice = t "out_of_stock"
    end

    respond_to do |format|
      format.html do
        redirect_to carts_url,
          notice: notice
      end
      format.json{head :no_content}
      format.js{render layout: false}
    end
  end

  def destroy
    cart_item = CartItem.find_by id: params[:id]
    @cart_item_id = cart_item.id
    cart_item.destroy
    shoe = cart_item.shoe
    shoe.update quantity: (shoe.quantity + cart_item.quantity)
    respond_to do |format|
      format.html do
        redirect_to carts_url,
          notice: t("delete_item")
      end
      format.json{head :no_content}
      format.js{render layout: false}
    end
  end
end

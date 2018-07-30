class CartItemsController < ApplicationController
  def create; end

  def update
    notice = t "add_success"
    cart_item = CartItem.find_by id: params[:id]
    @shoe = cart_item.shoe
    count = cart_item.quantity
    if params[:cart_item][:quantity].to_i <= (@shoe.quantity + count)
      cart_item.update quantity: params[:cart_item][:quantity].to_i
      @shoe.update quantity:
        (@shoe.quantity + count - params[:cart_item][:quantity].to_i)
    else
      notice = t "out_of_stock"
    end
    respond_to js
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

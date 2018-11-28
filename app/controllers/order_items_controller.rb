class OrderItemsController < ApplicationController
  before_action :authenticate_user!
 
  def index
  end
 
  def show
  end
 
  def create
    current_user.orders.create(total: 0, status: "open") if !current_order || current_order.status != "open"
    @order_item = current_order.order_items.create(price: params[:price], product_id: params[:product_id])
    @order_item.save
    redirect_to products_path
  end
 
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order = Order.find(@order_item.order_id)
    if(@order.status = 'open')
      @order_item.destroy
    end
    redirect_to order_path(@order)
  end
 
  private
 
  def order_items_params
    params.permit(:order_id, :price, :product_id)
  end
end
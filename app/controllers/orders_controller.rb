class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @orders_o = Order.where('extract(month from created_at) = ?', Time.now.month).order('id DESC')
      @orders_m = Order.where('extract(month from created_at) = ?', Time.now.month).order('id DESC')
      @month_price = 0 + (@orders_m.sum { |order| order.total_price if order.status == 'in progress' || order.status == 'closed' } if @orders_m.last)
    else
      @orders_o = current_user.orders.where('extract(month from created_at) = ?', Time.now.month).order('id DESC')
      @orders_m = current_user.orders.where('extract(month from created_at) = ?', Time.now.month).order('id DESC')
      @month_price = 0 + (@orders_m.sum { |order| order.total_price if order.status == 'in progress' || order.status == 'closed' } if @orders_m.last)
    end
  end

  def show


    if current_user.admin?
      @order = Order.find(params[:id])
    else
      @order = current_user.orders.find(params[:id])
    end
  end

  def create
  end

  def destroy

  end

end
class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @orders_o = Order.where("cast(strftime('%m', created_at) as int) < ?", Time.now.month).order('id DESC')
      @orders_m = Order.where("cast(strftime('%m', created_at) as int) = ?", Time.now.month).order('id DESC')
      @month_price = 0 + (@orders_m.sum { |order| order.total_price if order.status == 'in progress' || order.status == 'closed' } if @orders_m.first && (@orders_m.first.status == 'in progress' || @orders_m.first.status == 'closed')).to_i
    else
      @orders_o = current_user.orders.where("cast(strftime('%m', created_at) as int) < ?", Time.now.month).order('id DESC')
      @orders_m = current_user.orders.where("cast(strftime('%m', created_at) as int) = ?", Time.now.month).order('id DESC')
      @month_price = 0 + (@orders_m.sum { |order| order.total_price if order.status == 'in progress' || order.status == 'closed' } if @orders_m.first && (@orders_m.first.status == 'in progress' || @orders_m.first.status == 'closed')).to_i
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
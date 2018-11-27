class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @orders = Order.order('id DESC')
    else
      @orders = current_user.orders.order('id DESC')

    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
  end

  def destroy

  end

end

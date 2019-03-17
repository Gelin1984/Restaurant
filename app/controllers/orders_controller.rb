class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      #biore zamowienia gdzie miesiąc z atrybutu created_at równa się obecnemu miesiacowi
      @orders_o = Order.where("cast(strftime('%m', created_at) as int) < ?", Time.now.month).order('id DESC')
      #szukam zamowien z tego miesiaca
      @orders_m = Order.where("cast(strftime('%m', created_at) as int) = ?", Time.now.month).order('id DESC')
      #sumuje warosci opłaconych zamówien z tego miesiaca
      @month_price = 0 + (@orders_m.sum { |order| order.total_price if order.status == 'in progress' || order.status == 'closed' } if @orders_m.first && (@orders_m.first.status == 'in progress' || @orders_m.first.status == 'closed')).to_i
    else
      #znajdz miesiace spoza mojego miesiaca
      @orders_o = current_user.orders.where("cast(strftime('%m', created_at) as int) < ?", Time.now.month).order('id DESC')
      #znajdz zamowienia spoza miesiaca
      @orders_m = current_user.orders.where("cast(strftime('%m', created_at) as int) = ?", Time.now.month).order('id DESC')
      # sumuj warosci opłaconych zamówien z tego miesiaca i zamieniamy w inta
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
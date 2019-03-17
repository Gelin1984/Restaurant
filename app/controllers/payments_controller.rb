class PaymentsController < ApplicationController

  def create

    @user = current_user
    @order = current_user.orders.last
    if(@order.status == "open")

      token = params[:stripeToken]
      begin
        charge = Stripe::Charge.create(
          amount: (@order.total_price*100).to_i,
          currency: "usd",
          source: token,
          description: params[:stripeEmail]
        )


        if charge.paid
          @order.change_status("in progress")

          flash[:notice] = "Your payment was processed successfully"
          UserMailer.order_placed(@user, @order).deliver_now
        end

      rescue Stripe::CardError => e
        # The card has been declined
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      end
    end

    redirect_to products_path

  end
end
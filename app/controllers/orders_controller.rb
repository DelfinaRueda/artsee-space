class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.where(params[:id])
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    artwork = Artwork.find(params[:artwork_id])
    order = Order.create!(artwork: artwork, amount: artwork.price_cents, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: artwork.title,
        amount: artwork.price_cents * 100,
        currency: 'gbp',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end
end

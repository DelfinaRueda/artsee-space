class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @artwork = Artwork.find(@order.artwork_id)
    @artwork[:sales] += 1
    @artwork.save
  end
end

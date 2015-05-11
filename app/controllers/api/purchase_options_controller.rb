class Api::PurchaseOptionsController < ApplicationController
  def buy
    @order = PurchaseOption.find(purchase_params[:purchase_option_id])
    current_user.orders.create(purchase_option_id: @order.id)
    render json: @order.movie, status: 200
  end

  private

  def purchase_params
    params.require(:purchase_option_id)
  end
end

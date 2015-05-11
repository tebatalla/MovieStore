class Api::PurchaseOptionsController < ApplicationController
  def buy
    @option = PurchaseOption.find(purchase_param)
    @order = current_user.orders.new(purchase_option_id: @option.id)
    if @order.save
      render json: @order, status: 200
    else
      render json: { error: ["Movie already purchased"] }, status: 422
    end
  end

  private

  def purchase_param
    params.require(:purchase_option_id)
  end
end

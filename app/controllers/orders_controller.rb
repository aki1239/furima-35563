class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:index, :create]
before_action :set_order, only:[:index, :create]

  def index
    
    @order_address = OrderAddress.new
    
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end
  private

  def order_params
    
    params.require(:order_address).permit(:post_code, :city, :prefecture_id, :home_number, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  def set_order
    @item = Item.find(params[:item_id])
  end

end

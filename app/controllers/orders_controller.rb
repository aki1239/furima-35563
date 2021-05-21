class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:index, :create]
before_action :set_order, only:[:index, :create]
before_action :move_to_index, only:[:index, :create]
before_action :move_to_path, only:[:index, :create]
  def index
    
    @order_address = OrderAddress.new
    
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end
  private

  def order_params
    
    params.require(:order_address).permit(:post_code, :city, :prefecture_id, :home_number, :building_name, :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def set_order
    @item = Item.find(params[:item_id])
  end
  def move_to_index
    if @item.user.id.to_i == current_user.id
      redirect_to root_path(current_user)
    end
  end
  def move_to_path
    if @item.order.present?
      redirect_to root_path
  end
end


def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,  
    card: order_params[:token],    
     currency: 'jpy'                 
    )
end
end
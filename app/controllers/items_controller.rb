class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

 private

  def item_params
    params.require(:item).permit(:image,:name,:price,:description,:category_id,:status_id,:cost_id,:prefecture_id,:days_id,:user_id).merge(user_id: current_user.id)
  end
end
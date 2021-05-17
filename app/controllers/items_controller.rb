class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_to_index, except: [:index, :show]
  before_action :baria_user, only: [:edit, :update]

  def index
    @items = Item.order(id: :desc)
  end

  def new
    @item = Item.new
  
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else render :new
    end
  end

  def show
    
    @item = Item.find(params[:id])
    
  end

  def edit
    @item = Item.find(params[:id])
    
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path
    else
    @item = item
    render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :description, :category_id, :status_id, :cost_id, :prefecture_id, :days_id,
                                 :user_id).merge(user_id: current_user.id)
  end


  def baria_user
    unless Item.find(params[:id]).user.id.to_i == current_user.id
        redirect_to root_path(current_user)
    end
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end

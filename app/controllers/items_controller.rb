class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :baria_user, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end
    
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
    render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
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

  def set_item
    @item = Item.find(params[:id])
  end
end

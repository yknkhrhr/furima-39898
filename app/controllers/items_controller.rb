class ItemsController < ApplicationController

  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :detail, :category_id, :status_id, :fee_burden_id, :prefecture_id, :send_day_id, :price).merge(user_id: current_user.id)
  end


end

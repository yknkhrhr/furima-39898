class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :detail, :category_id, :status_id, :fee_burden_id, :prefecture_id, :send_day_id, :price).merge(user_id: current_user.id)
  end


end

class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :detail).merge(user_id: current_user.id)
  end


end

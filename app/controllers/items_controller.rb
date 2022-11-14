class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end
end


private

  def message_params
    params.require(:item).permit(:product_name, :description, :price,:image).merge(user_id: current_user.id)
  end
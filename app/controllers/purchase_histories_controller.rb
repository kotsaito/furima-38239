class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_root, only: :index

  def index
    @purchase_history_order = PurchaseHistoryOrder.new
  end

  def create
    @purchase_history_order = PurchaseHistoryOrder.new(purchase_history_params)
    if @purchase_history_order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_history_params[:token],
        currency: 'jpy'
      )
      @purchase_history_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_history_order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :tell).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_root
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase_history
  end
end

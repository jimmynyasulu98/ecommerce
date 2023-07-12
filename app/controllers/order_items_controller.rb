class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = current_cart.order.items
  end

  def add

    current_cart.add_item(
      movie_id: params[:id], user_id: current_user.id
    )

    redirect_to cart_path
  end

  def destroy
    current_cart.remove_item(id: params[:id])
    redirect_to cart_path
  end


end

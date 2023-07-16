class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_cart.order(user_id: current_user.id).order_items
  end

  def add

    current_cart.add_item(
      movie_id: params[:id], user_id: current_user.id
    )

    redirect_to cart_path
  end

  def update
      current_cart.update_item(
        order_item: params[:item_id] , task: params[:task]
      )

      redirect_to cart_path
  end

  def submit_order
    current_cart.order(user_id: current_user.id).update(stage: 1)
    session[:cart_token] = nil
    redirect_to root_path
  end

  def destroy
    current_cart.remove_item(id: params[:id], user_id: current_user.id)
    redirect_to cart_path
  end


end

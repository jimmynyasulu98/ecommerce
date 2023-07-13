class ShoppingCart

  def initialize(token:)
    @token = token
  end

  def order(user_id)

    @order ||= Order.find_or_create_by(token: @token) do |order|
      order.total = 0
      order.user_id = user_id
    end
  end

  def items_count
    order.items.sum(:quantity)
  end

  def add_item(movie_id: , user_id:)
    movie = Movie.find(movie_id)

    order_item = order(user_id).order_items.find_or_initialize_by(
      movie_id: movie_id
    )

    order_item.price = movie.price
    order_item.subtotal +=  movie.price
    order_item.quantity += 1
    order_item.save
  end

  def update_item(order_item: , task:)

    order_item = OrderItem.find(order_item)
    order = Order.find(order_item.order_id)

    if task == "add"
      order_item.subtotal +=  order_item.movie.price
      order_item.quantity += 1
      order.total  +=  order_item.movie.price
    elsif task == "subtract"
      order_item.subtotal -=  order_item.movie.price
      order_item.quantity -= 1
      order.total  -=  order_item.movie.price
    else
      return
    end
    order_item.save
    order.save

  end

  def remove_item(id:)
    order.items.destroy(id)
  end

end

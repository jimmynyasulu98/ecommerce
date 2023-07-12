class ShoppingCart

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token) do |order|
      order.total = 0
    end
  end

  def items_count
    order.items.sum(:quantity)
  end

  def add_item(movie_id:)
    movie = Movie.find(movie_id)

    order_item = order.items.find_or_initialize_by(
      movie_id: movie_id
    )

    order_item.price = movie.price
    order_item.quantity = 1

    order_item.save
  end

  def remove_item(id:)
    order.items.destroy(id)
  end

end

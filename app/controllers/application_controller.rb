class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery  with: :exception , prepend: true
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :current_cart

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end

  helper_method :current_cart

  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_back(fallback_location: root_path)
    end

    def cart_token
      return @cart_token unless @cart_token.nil?

      session[:cart_token] ||= SecureRandom.hex(8)
      @cart_token = session[:cart_token]
    end
end

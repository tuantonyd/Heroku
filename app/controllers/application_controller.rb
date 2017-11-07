class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def get_cart_items
    @cart_items = []
    logger.warn(cookies)
    cookies.each do |cookie|
      if (cookie[0].include? "item_")
        item_cookie = cookie[0].split("item_")
        logger.warn(item_cookie[1])
         @cart_items << {item: Item.find(item_cookie[1]), qty: cookie[1]}
      end
    end
    return @cart_items
  end

  def verify_admin
    logger.warn("Verifying administrator")
    if !current_customer.try(:admin?)
      redirect_to :forbidden
    end
  end
  
  def get_cart_total
    @cart_items = get_cart_items
    total = 0.0
    logger.warn(@cart_items)
    @cart_items.each do |cart_item|
      total = (cart_item[:item].price.to_d * cart_item[:qty].to_d) + total
    end
    return total
  end

  def del_cookies
    cookies.each do |cookie|
      if (cookie[0].include? "item_")
        if cookies.delete cookie[0]
          puts "Cookie deleted"
          # cookies[:itemsInCart] = 0
        end
      end
    end
  end


  def configure_permitted_parameters
    logger.warn("Permitted parameters:")
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :zip,:last_name, :address, :city, :state_id, :stripeToken])
  end

end

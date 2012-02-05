class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  private 

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      return cart
    end

    def set_locale
      locale = :ja
      if locale 
        if I18n.available_locales.include?(locale)
          I18n.locale = locale
        end
      end
    end

    def default_url_options
      {locale: I18n.locale }
    end
end

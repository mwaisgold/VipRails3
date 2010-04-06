class LoginController < ApplicationController
  def index
  end

  def do_login
    # remove_cookie
    cookies[:cookie_login] = params[:name]
    redirect_to "#{params[:url_to]}"
  end

  def logout
    remove_cookie
    redirect_to Item.first
  end

  private
    def remove_cookie
      cookies.delete :cookie_login
    end

end

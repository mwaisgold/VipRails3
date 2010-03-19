class CookiemlController < ApplicationController

  def index
    params.each { |ck, value|
      cookies[ck.delete("setCK")] = value if ck.include? "setCK"
    }
  end

end

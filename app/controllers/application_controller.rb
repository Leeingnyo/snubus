class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def min_and_sec(time)
    @min_and_sec = ("#{(time / 60)}분" if time / 60 != 0).to_s + " #{time % 60}초"
  end
  helper_method :min_and_sec

  def hour_and_min(time)
    @hour_and_min = ("#{(time / 60)}시" if time / 60 != 0).to_s + " #{time % 60}분"
  end
  helper_method :hour_and_min
end

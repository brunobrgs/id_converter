class HomeController < ApplicationController
  def index
  end

  def reload_sessions
    set_user_sessions
    render nothing: true
  end
end

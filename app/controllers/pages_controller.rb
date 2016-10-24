class PagesController < ApplicationController
  def front
    redirect_to campaigns_path if logged_in?
  end
end

class StaticPagesController < ApplicationController
  before_action :get_title

  def home
    @micropost = current_user.microposts.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end

  private
  def get_title
    @title = "#{params[:action]} | Ruby on Rails Tutorial Sample App"
  end
end

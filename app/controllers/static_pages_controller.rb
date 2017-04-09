class StaticPagesController < ApplicationController
  before_action :get_title

  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
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

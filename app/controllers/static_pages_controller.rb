class StaticPagesController < ApplicationController
  before_action :get_title

  def home
  end

  def help
  end

  def about
  end

  private
  def get_title
    @title = "#{params[:action]} | Ruby on Rails Tutorial Sample App"
  end
end

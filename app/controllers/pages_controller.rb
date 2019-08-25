class PagesController < ApplicationController
  before_action :authenticate_user! , only: [:home]
  def home
    @posts = current_user.posts
  end
end

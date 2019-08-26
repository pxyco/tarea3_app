class PagesController < ApplicationController
  before_action :authenticate_user! , only: [:home]
  def home
    @posts = current_user.posts
  end
  
  def create
    @user = current_user
    email=params[:email]
    puts email
    @user.create_share_digest
    puts @user.share_token
    UserMailer.share_calories(email, current_user).deliver_now
    # UserMailer.share_calories(email, current_user).deliver_now
    # user.send_share_email
  end
  
  def edit
    @user = User.find_by_share_token!(params[:id])
  end
end

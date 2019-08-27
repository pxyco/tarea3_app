class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @search = PostSearch.new(params[:search])
    @posts = @search.scope(current_user.id).page(params[:page])
  end
  
  def create
    @user = current_user
    email=params[:email]
    puts email
    @user.create_share_digest
    puts @user.share_token
    UserMailer.share_calories(email, current_user).deliver_now
    redirect_to pages_path, :alert => "Email with share link sent to your friend"
  end
  
  def edit
    @user = User.find_by_share_token!(params[:id])
  end
end

class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:edit]
  def index
    @user = current_user
    @search = PostSearch.new(params[:search])
    @posts = @search.scope(current_user.id)
    @count = @posts.count
    @posts = @search.scope(current_user.id).page(params[:page])
    
    if params[:refresh].nil? 
      @refresh = "Off"
    else
      @refresh = params[:refresh]
    end
  end
  
  def create
    redirect_to root_path
    @user = current_user
    email=params[:email]
    @user.create_share_digest
    UserMailer.share_calories(email, current_user).deliver_now
    redirect_to pages_path
  end
  
  def edit
    id = params[:id]
    puts id
    share_token_digest = Digest::MD5.hexdigest(params[:id])
    puts share_token_digest
    @user = User.find_by_share_token!(share_token_digest)
  end
end

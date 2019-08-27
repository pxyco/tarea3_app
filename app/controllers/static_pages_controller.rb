class StaticPagesController < ApplicationController
  def home
    if current_user
      redirect_to pages_path
    end
  end
end

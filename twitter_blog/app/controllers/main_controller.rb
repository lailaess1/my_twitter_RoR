class MainController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
      @articles = Article.all.order(updated_at: :desc).limit(4)
      

    end
  end
end

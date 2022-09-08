class ArticlesController < ApplicationController

  def index
      @users = User.all
      @articles = Article.all.order(updated_at: :desc)
  end

  def show
    # @user = User.find(params[:id])
    @article = Article.find(params[:id])
  end

  # def new
  #   if session[:user_id]
  #     @user = User.find(session[:user_id])
  #     @article = @user.articles
  #   end
  # end

  def create
      @user = User.find(params[:user_id])
      @article = @user.articles.create(article_params)
      redirect_to user_path(@user)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])

    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit  
    end
  end


  def destroy
      @user = User.find(params[:user_id])
      @article = @user.articles.find(params[:id])
      @article.destroy
      redirect_to user_path(@user)
  end

  private
      def article_params
          params.require(:article).permit(:body)
      end 

      def find_article
          @article = Article.find(params[:article_id])
      end


end

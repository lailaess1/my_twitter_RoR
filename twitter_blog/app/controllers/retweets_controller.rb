class RetweetsController < ApplicationController
    before_action :find_article
    before_action :find_retweet, only: [:destroy]

    def create
        if already_retweeted?
            flash[:notice] = "You can't retweet more than once"
        else
            @article.retweets.create(user_id: session[:user_id])

            @user = User.find(session[:user_id])
            @newArticle = @user.articles.create(body: @article.body)
        end
        redirect_to request.referer
    end

    def destroy
        if !(already_retweeted?)
            flash[:notice] = "Cannot cancel retweet"
        else
            @user = session[:user_id]

            @artcl = Article.where(body: @retweet.article.body).where(user_id: @user)

            @artcl.each do |art|
                art.destroy
            end 

            @retweet.destroy

        end
        redirect_to request.referer
    end

    private 
        def find_article
            @article = Article.find(params[:article_id])
        end

        def find_retweet
            @retweet = @article.retweets.find(params[:id])
        end

        def already_retweeted?
            Retweet.where(user_id: session[:user_id], article_id: params[:article_id]).exists?
        end
end

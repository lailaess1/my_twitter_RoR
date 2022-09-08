class CommentsController < ApplicationController
    def create
        user = User.find(session[:user_id])
        @article = Article.find(params[:article_id])
        # @comment = @user.articles.comments.create(comment_params)
        # @comment = Comment.new(comment_params, user_id: @user, article_id: @article)
        @comment = @article.comments.create(comment_params.merge(user_id: session[:user_id]))
        redirect_to article_path(@article)
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @article = Article.find(@comment.article_id)

        if @comment.update(comment_params)
            redirect_to @article
        else
            render :edit
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end

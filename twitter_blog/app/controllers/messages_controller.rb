class MessagesController < ApplicationController
    

    def index
        
        @session_user = User.find(session[:user_id])
        @user = User.find(params[:user_id])
        @messages = Message.where(user_id: session[:user_id],receiver: params[:user_id]).or(Message.where(user_id: params[:user_id], receiver: session[:user_id])).order(created_at: :asc)
    end 
    
    def create
        @user = User.find(session[:user_id])
        @receiver = User.find(params[:user_id])

        # render plain: @user.id
        @message = @user.messages.create(message_params.merge(receiver: @receiver.id))
        redirect_to request.referer
    end

    private
        def message_params
            params.require(:message).permit(:body)
        end
end

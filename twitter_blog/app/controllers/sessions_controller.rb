class SessionsController < ApplicationController


    def show
    end

    def new
    end

    def create
        # user = User.find_by(email: params[:email])
        user = User.find_by(email: params[:email], password: params[:password])

        if user.present?
            # && user.valid_password?(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end

    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end
end
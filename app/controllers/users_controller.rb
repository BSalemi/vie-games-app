class UsersController < ApplicationController

    def home 

    end 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.valid?
           @user.save
           session[:user_id] = @user.id 
           redirect_to user_path(@user)
        else 
            render :new 
        end
    end 

    def show 
        @user = User.find(session[:user_id])
    end

    def edit 

    end 

    def update 

    end 


    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end 
end

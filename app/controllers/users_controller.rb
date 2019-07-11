class UsersController < ApplicationController
    before_action set_user, only: [:show, :update, :destroy]

    private 

    def user_params
        params.permit(:name, :username, :password, :age, :gender)
    end 
    
    def set_user
        @user = User.find(params[:id])
    end 
end

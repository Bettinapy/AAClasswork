class UsersController < ApplicationController
    def index
        users = User.all
        if params.has_key?(:user_name)
            users = User.where("user_name iLIKE ?", "%#{params[:user_name]}%")     
        end
        render json: users
    end

    def show
        render json: User.find(params[:id])      
    end

    def create
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save!
            render json: user
        else  
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user_url(user)
        else
            render json: user.errors.full_messages, status:422
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to users_url
    end

    def user_params
        params.require(:user).permit(:user_name)
    end
end

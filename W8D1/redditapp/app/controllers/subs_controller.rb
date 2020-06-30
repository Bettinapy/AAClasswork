class SubsController < ApplicationController
    before_action :require_moderator, only: [:edit, :update]
    def new 
        @sub = Sub.new 
        render :new
    end

    def index 
        @subs = Sub.all  
        render :index
    end

    def show 
        @sub = Sub.find(params[:id])
        render :show 
    end

    def create 
        @sub =  current_user.subs.new(sub_params)      
        if @sub.save
           redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to subs_url
        end       
    end

    def require_moderator
        @sub = Sub.find(params[:id])
        @sub.user_id == current_user.id
    end

    def edit 
        @user = current_user 
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update 
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = ['Invalid title or description']
            render :edit
        end
    end

    

    def sub_params 
        params.require(:sub).permit(:title, :description)
    end
end

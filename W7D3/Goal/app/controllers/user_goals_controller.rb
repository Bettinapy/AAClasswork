class UserGoalsController < ApplicationController
    
    before_action :logged_in

    def index 
        @goals = UserGoal.all
        render :index
    end


end

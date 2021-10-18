class AnalysesController < ApplicationController
    before_action :authenticate_user!
    def show
     @income = Income.where(user_id:[current_user.id])
     @expend = Expend.where(user_id:[current_user.id])
    end
end

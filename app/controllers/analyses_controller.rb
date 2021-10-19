class AnalysesController < ApplicationController
    before_action :authenticate_user!
    def show
     @income = Income.where(user_id:[current_user.id])
     @expends = Expend.where(user_id:[current_user.id])
    end

    def search
       
        @income = Income.where(user_id:[current_user.id])
        @expends = Expend.where(user_id:[current_user.id])
        d = Date.parse(params[:expend_date])
        @expend = Expend.where(user_id:[current_user.id]).where(expend_date: [d.beginning_of_month..d.end_of_month]).search(params[:expend_date])
        @expend_date = params[:expend_date]
        render("analyses/show")
        
      end
end

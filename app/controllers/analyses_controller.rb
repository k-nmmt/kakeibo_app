class AnalysesController < ApplicationController
    before_action :authenticate_user!
    def show
     @income = Income.where(user_id:[current_user.id])
     @expends = Expend.where(user_id:[current_user.id])
     @expend = Expend.where(user_id:[current_user.id])
     @saving_amount =  Income.where(user_id:[current_user.id]).sum(:income_amount) - Expend.where(user_id:[current_user.id]).sum(:expend_amount)
     @sum_of_expend = Expend.where(user_id:[current_user.id]).sum(:expend_amount)
    end

    def search
        @income = Income.where(user_id:[current_user.id])
        @expends = Expend.where(user_id:[current_user.id])
        d = Date.parse(params[:expend_date])
        @expend = Expend.where(user_id:[current_user.id]).where(expend_date: [d.beginning_of_month..d.end_of_month]).search(params[:expend_date])
        @expend_month = Date.parse(params[:expend_date]).strftime("%-m月")
        @sum_of_expend = Expend.where(user_id:[current_user.id]).where(expend_date: [d.beginning_of_month..d.end_of_month]).search(params[:expend_date]).sum(:expend_amount)
        render("analyses/show")
      end
end

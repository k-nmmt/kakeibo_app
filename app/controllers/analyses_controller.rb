class AnalysesController < ApplicationController
    before_action :authenticate_user!
    def show
     @income = Income.where(user_id:[current_user.id])
     @expends = Expend.where(user_id:[current_user.id])
     @expend = Expend.where(user_id:[current_user.id])
     @sum_of_expend = Expend.where(user_id:[current_user.id]).sum(:expend_amount)
    # @saving_amount = Income.where(user_id:[current_user.id]).group_by_month(:income_date).sum(:income_amount) - Expend.where(user_id:[current_user.id]).group_by_month(:expend_date).sum(:expend_amount)
      # @arr_balence=Income.where(user_id:[current_user.id]).group_by_month(:income_date).sum(:income_amount).zip(Expend.where(user_id:[current_user.id]).group_by_month(:expend_date).sum(:expend_amount)).each do|inc,exp|
      # end
      income_hash = @income.group_by_month(:income_date).sum(:income_amount)
      expends_hash = @expends.group_by_month(:expend_date).sum(:expend_amount).transform_values { |v| v * -1 }
      @arr_balence = income_hash.merge(expends_hash) { |key, vi, ve| vi + ve }

    end

    def search
        @income = Income.where(user_id:[current_user.id]).where(saving_id:params[:id])
        @expends = Expend.where(user_id:[current_user.id]).where(saving_id:params[:id])
        d = Date.parse(params[:expend_date])
        @expend = Expend.where(user_id:[current_user.id]).where(expend_date: [d.beginning_of_month..d.end_of_month]).search(params[:expend_date]).where(saving_id:params[:id])
        @expend_month = Date.parse(params[:expend_date]).strftime("%-m月")
        
        if params[:id] 
          @saving_name = "口座名：" + Saving.where(id:params[:id]).pluck(:saving_name).join("")
        end

        @sum_of_expend = Expend.where(user_id:[current_user.id]).where(expend_date: [d.beginning_of_month..d.end_of_month]).search(params[:expend_date]).where(saving_id:params[:id]).sum(:expend_amount)
        income_hash = @income.group_by_month(:income_date).order(income_date: :ASC).sum(:income_amount)
        expends_hash = @expends.group_by_month(:expend_date).order(expend_date: :ASC).sum(:expend_amount).transform_values { |v| v * -1 }
        @arr_balence = income_hash.merge(expends_hash){ |key, vi, ve| vi + ve }
        render("analyses/show")
      end
end

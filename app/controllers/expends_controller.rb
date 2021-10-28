class ExpendsController < ApplicationController
  before_action :authenticate_user!
 # before_action :ensure_correct_user, only: [:edit, :update, :destroy]

    def new
        @expend = Expend.new
        @expends = Expend.where(user_id:[current_user.id]).reverse_order.paginate(page:params[:page], per_page: 10)
        @expend_month = nil
        @saving_name = "口座：" +Saving.where(id:params[:id]).pluck(:saving_name).join("")
    end

    def create
        @expend = Expend.new(expend_params)
        @expend.user_id = current_user.id
        @expends = Expend.where(user_id:[current_user.id]).paginate(page:params[:page], per_page: 10)
        if @expend.save
            flash[:notice] = "成功　#{Expend.where(user_id:current_user.id).pluck(:expend_date).last.strftime("%Y年%-m月%-d日")}　#{Expend.where(user_id:current_user.id).pluck(:group).last}　￥#{Expend.where(user_id:current_user.id).pluck(:expend_amount).last}　メモ：#{Expend.where(user_id:current_user.id).pluck(:memo).last}"
          redirect_to("/expends/new")
        else
            flash.now[:alert] = "失敗！"
          render("expends/new")
        end
      end

      def edit
        @expend = Expend.find(params[:id])
      end
    
      def update
        @expend = Expend.find(params[:id])
        if @expend.update(expend_params)
          flash[:notice] = "成功！"
          redirect_to("/expends/new")
        else
          flash.now[:alert] = "失敗！"
          render("expends/edit")
        end
      end

      def destroy
        @expend = Expend.find(params[:id])
        @expend.destroy
        flash[:notice] = "成功！"
        redirect_to("/expends/new")
      end

      def search
        if params[:id].empty?
          flash[:alert] = "検索失敗　※口座を選択してください"
          redirect_to("/incomes/new")
        elsif params[:expend_date].empty?
          flash[:alert] = "検索失敗　※項目を選択してください"
          redirect_to("/expends/new")
        else
        d = Date.parse(params[:expend_date])
        @expends = Expend.where(user_id:[current_user.id]).where(saving_id:params[:id]).where(expend_date: [d.beginning_of_month..d.end_of_month]).search(params[:expend_date]).reverse_order.paginate(page:params[:page], per_page: 10)
        @expend_month = Date.parse(params[:expend_date]).strftime("%-Y年%-m月")
        @expend = Expend.new
        @saving_name = "口座：" +Saving.where(id:params[:id]).pluck(:saving_name).join("")
        render("expends/new")
      end
    end

      private
        def expend_params
          params.require(:expend).permit(:saving_id, :user_id, :expend_date, :group, :expend_amount, :memo)
        end

       # def ensure_correct_user
        # @expend = Expend.find_by(id: params[:id])
        # if @expend.user_id != current_user.id
     #    flash[:alert] = "権限がありません"
      #   end
     #   end
        
end

class IncomesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
        @test = "テスト収入"
    end

    def new
        @income = Income.new
        @incomes = Income.where(user_id:current_user.id).paginate(page:params[:page], per_page: 10)
       
    end

    def create
        @income = Income.new(income_params)
        @income.user_id = current_user.id
        if @income.save
            flash[:notice] = "成功！"
          redirect_to("/incomes/new")
        else
            flash.now[:alert] = "失敗！"
          render("incomes/new")
        end
      end

      def edit
        @income = Income.find(params[:id])
      end
    
      def update
        @income = Income.find(params[:id])
        if @income.update(income_params)
          flash[:notice] = "成功！"
          redirect_to("/incomes/new")
        else
          flash.now[:alert] = "失敗！"
          render("incomes/edit")
        end
      end

      def destroy
        @income = Income.find(params[:id])
        @income.destroy
        flash[:notice] = "成功！"
        redirect_to("/incomes/new")
      end

      def search
        d = Date.parse(params[:income_date])
        @incomes = Income.where(user_id:[current_user.id]).where(income_date: [d.beginning_of_month..d.end_of_month]).where(saving_id:params[:id]).search(params[:income_date]).paginate(page:params[:page], per_page: 10)
        @income_month = Date.parse(params[:income_date]).strftime("%-m月")
        render("incomes/new")
      end


      private
        def income_params
          params.permit(:saving_id, :user_id, :income_date, :income_amount, :memo)
        end

end

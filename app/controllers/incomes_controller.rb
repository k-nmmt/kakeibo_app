class IncomesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
        @test = "テスト収入"
    end

    def new
        @income = Income.new
        @incomes = Income.all
    end

    def create
        @income = Income.new(income_params)
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


      private
        def income_params
          params.require(:income).permit(:saving_id, :income_date, :income_amount, :memo)
        end

end

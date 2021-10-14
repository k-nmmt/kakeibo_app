class IncomesController < ApplicationController

    def show
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
          redirect_to("/incomes")
        else
            flash.now[:alert] = "失敗！"
          render("incomes/new")
        end
      end
      private
        def income_params
          params.require(:income).permit(:income_date, :income_amount, :memo)
        end

end

class ExpendsController < ApplicationController
 
 
    def index
        @test = "テスト支出"
    end


    def new
        @expend = Expend.new
        @expends = Expend.all
    end

    def create
     # binding.pry
        @expend = Expend.new(expend_params)
        if @expend.save
            flash[:notice] = "成功！"
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
      private
        def expend_params
          params.require(:expend).permit(:saving_id,
           :expend_date, :group, :expend_amount, :memo)
        end
        
end

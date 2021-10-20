class ExpendsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
    def index
        @test = "テスト支出"
    end


    def new
        @expend = Expend.new
        @expends =Expend.where(user_id:current_user.id).paginate(page:params[:page], per_page: 5)
    end

   # def search
  #    @expends = Expend.search(params[:expend_date])
   #   @expend_date = params[:expend_date]
   #   render("expends/new")
   # end

    def create
     # binding.pry
        @expend = Expend.new(expend_params)
        @expend.user_id = current_user.id
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

      def destroy
        @expend = Expend.find(params[:id])
        @expend.destroy
        flash[:notice] = "成功！"
        redirect_to("/expends/new")
      end

      def search
        d = Date.parse(params[:expend_date])
        @expends = Expend.where(user_id:[current_user.id]).where(expend_date: [d.beginning_of_month..d.end_of_month]).search(params[:expend_date]).paginate(page:params[:page], per_page: 5)
        render("expends/new")
      end

      private
        def expend_params
          params.require(:expend).permit(:saving_id,:user_id,
           :expend_date, :group, :expend_amount, :memo)
        end

        def ensure_correct_user
          @expend = Expend.find_by(id: params[:id])
          if @expend.user_id != current_user.id
          flash[:alert] = "権限がありません"
           redirect_to("/expends/#{@expend.id}")
          end
        end
        
end

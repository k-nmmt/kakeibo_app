class SavingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
      @saving = Saving.where(id:params[:id]).pluck(:saving_name).join("")
      @saving_amount =  Income.where(saving_id:params[:id]).sum(:income_amount) - Expend.where(saving_id:params[:id]).sum(:expend_amount)
      @created_at = Saving.where(id:params[:id]).pluck(:created_at).join("")
    end

    def new
        
        @saving = Saving.new
        @savings = Saving.where(user_id:current_user.id).paginate(page:params[:page], per_page: 5)
    end

    def create
        @saving = Saving.new(saving_params)
        @saving.user_id = current_user.id
        if @saving.save
          flash[:notice] = "成功！初期残高を入力しましょう！"
          redirect_to("/incomes/new")
        else
          flash.now[:alert] = "失敗！"
          render("savings/new")
        end
    end

     def edit
        @saving = Saving.find(params[:id])
      end
    
      def update
        @saving = Saving.find(params[:id])
        if @saving.update(saving_params)
          flash[:notice] = "成功！"
          redirect_to("/savings/new")
        else
          flash.now[:alert] = "失敗！"
          render("savings/edit")
        end
      end

      def destroy
        @saving = Saving.find(params[:id])
        @saving.destroy
        flash[:notice] = "成功！"
        redirect_to("/savings/new")
      end


      private
      def saving_params
        params.require(:saving).permit(:saving_name)
      end

end

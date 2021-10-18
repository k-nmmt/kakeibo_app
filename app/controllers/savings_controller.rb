class SavingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
        @test = "テスト　口座"
    end

    def new
        @saving = Saving.new
        @savings = Saving.where(user_id:current_user.id).paginate(page:params[:page], per_page: 5)
    end

    def create
        @saving = Saving.new(saving_params)
        @saving.user_id = current_user.id
        if @saving.save
          flash[:notice] = "成功！"
          redirect_to("/savings/new")
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

class SavingsController < ApplicationController
    def show
        @test = "テスト　口座"
    end

    def new
        @saving = Saving.new
        @savings = Saving.all
    end

    def create
        @saving = Saving.new(saving_params)
        @saving.user_id = current_user.id
        if @saving.save
          flash[:notice] = "成功！"
          redirect_to("/savings")
        else
          flash.now[:alert] = "失敗！"
          render("savings/new")
        end
      end

      private
      def saving_params
        params.require(:saving).permit(:saving_name)
      end

end

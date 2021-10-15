class AnalysesController < ApplicationController
    def show
        @expend = Expend.group("group").count
    end
end

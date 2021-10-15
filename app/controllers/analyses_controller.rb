class AnalysesController < ApplicationController
    def show
     @income = Income.all
    end
end

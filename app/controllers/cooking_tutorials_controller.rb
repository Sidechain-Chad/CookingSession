class CookingTutorialsController < ApplicationController

  def index
    @cookingtutorials = CookingTutorial.all
    # @cooking_tutorial = CookingTutorial.find(params[:id])
  end

  def show
    @cooking_tutorial = CookingTutorial.find(params[:id])
  end

  def new
    @cookingtutorial = CookingTutorial.new
  end

end

private

def name
  @cookingtutorials = CookingTutorial.all
end

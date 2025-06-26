class CookingTutorialsController < ApplicationController
  def index
    @cooking_tutorials = CookingTutorial.all
  end
  def show
    @cooking_tutorial = CookingTutorial.find(params[:id])
  end
  def new
    @cooking_tutorial = CookingTutorial.new
  end
  def create
    @cooking_tutorial = CookingTutorial.new(cooking_tutorial_params)
    if @cooking_tutorial.save
      redirect_to cooking_tutorial_path(@cooking_tutorial)
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def cooking_tutorial_params
    params.require(:cooking_tutorials).permit(:title, :location, :description, :date)
  end
end

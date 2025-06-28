class CookingTutorialsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
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
  @cooking_tutorial.user = current_user
  if @cooking_tutorial.save
    redirect_to @cooking_tutorial, notice: 'Tutorial created successfully.'
  else
    render :new, status: :unprocessable_entity
  end

end

  private
  def cooking_tutorial_params
    params.require(:cooking_tutorial).permit(:title, :location, :description, :date, :user_id, :image_url)
  end
end

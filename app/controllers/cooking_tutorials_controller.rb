class CookingTutorialsController < ApplicationController
  def cooking_tutorials
  end

  def index
  end

  def show

  end
end

private

def name
  @cooking_tutorial = CookingTutorial.all
end

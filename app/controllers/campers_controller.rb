class CampersController < ApplicationController

  before_action :camper_find, only: [:show, :edit, :update, :destroy]

  def index
    @campers = Camper.all
  end

  def show
    @activities = @camper.activities
  end

  def new
    @camper = Camper.new
  end

  def create
    @camper = Camper.create(camper_params)
    redirect_to camper_path(@camper)
  end

  private 

    def camper_find 
      @camper = Camper.find(params[:id])
    end

    def camper_params
      params.require(:camper).permit(:name, :age)
    end

end

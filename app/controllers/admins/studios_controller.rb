class Admins::StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
    @equipment = Equipment.new
    @equipment_genres = EquipmentGenre.all
  end

  def edit
    @studio = Studio.find(params[:id])
  end
  
  def update
    studio = Studio.find(params[:id])
    studio.update(studio_params)
    redirect_to admins_studio_path
  end
  
  private
  def studio_params
    params.require(:studio).permit(:name, :weekday_fee, :weekend_fee, :area)
  end
  
end

class Admins::EquipmentsController < ApplicationController
  def create
    equipment = Equipment.new(equipment_params)
    p equipment
    equipment.save!
    redirect_to request.referer
  end
  
  def destroy
    equipment = Equipment.find(params[:studio_id])
    equipment.destroy
    redirect_to request.referer
  end
  
  private
  def equipment_params
    params.require(:equipment).permit(:name, :studio_id, :equipment_genre_id)
  end
end

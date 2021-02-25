class Admins::PaidEquipmentsController < Admins::ApplicationController
  def index
    @paid_equipment = PaidEquipment.new
    @equipment_genres = EquipmentGenre.all
    @paid_equipments = PaidEquipment.all
  end
  
  def create
    paid_equipment = PaidEquipment.new(paid_equipment_params)
    paid_equipment.save!
    redirect_to request.referer
  end

  def edit
    redirect_to admins_paid_equipments_path
  end
  
  def destroy
    paid_equipment = PaidEquipment.find(params[:id])
    paid_equipment.destroy
    redirect_to admins_paid_equipments_path
  end
  
  private
  def paid_equipment_params
    params.require(:paid_equipment).permit(:name, :equipment_genre_id, :fee)
  end
end

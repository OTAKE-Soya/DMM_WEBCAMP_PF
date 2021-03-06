class Users::ReservationsController < Users::ApplicationController
  def new
    @reservation = Reservation.new
    @studios = Studio.all
    @paid_equipments = PaidEquipment.all
    @reservation.reserved_equipments.build
    
  end
  
  def create
    reservation = Reservation.new
    reservation.start_at = DateTime.parse("#{reservation_params[:date]} #{reservation_params["start_at(4i)"]}:00:00")
    reservation.end_at = DateTime.parse("#{reservation_params[:date]} #{reservation_params["end_at(4i)"]}:00:00")
    reservation.studio_id = reservation_params[:studio_id]
    reservation.user_id = current_user.id
    if reservation.start_at < reservation.end_at && reservation.start_at > DateTime.now
      if !Reservation.where('end_at > ? and ? > start_at', reservation.start_at, reservation.end_at).exists?
        reservation.total_fee = 0
        total_equipment_fee = 0
        if reserved_equipment_params[:paid_equipment_ids]
          reserved_equipment_params[:paid_equipment_ids].each do |paid_equipment_id|
            equipment_fee = PaidEquipment.find(paid_equipment_id).fee
            equipment_name = PaidEquipment.find(paid_equipment_id).name
            reservation.reserved_equipments.build(name: equipment_name, fee: equipment_fee)
            total_equipment_fee += equipment_fee
          end
        end
        reservation.fix_day_fee
        reservation.total_fee += (reservation.end_at.hour - reservation.start_at.hour) * (reservation.studio_fee_per_hour + total_equipment_fee)
        reservation.save
      end
    end
    redirect_to reservations_path
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def index
    @reservations = Reservation.where(user_id: current_user)
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(
      :date,
      :start_at,
      :end_at,
      :studio_id,
      :user_id,
    )
  end
  
  def reserved_equipment_params
    params.require(:reservation).permit(
      paid_equipment_ids: []
    )
  end
end
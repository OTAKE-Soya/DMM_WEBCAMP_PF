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
    if reservation.start_at < reservation.end_at
      if !Reservation.where('end_at > ? and ? > start_at', reservation.start_at, reservation.end_at).exists?
        reservation.total_fee = 0
        total_equipment_fee = 0
        if reserved_equipment_params[:paid_equipment_ids]
          reserved_equipment_params[:paid_equipment_ids].each do |paid_equipment_id|
            equipment_fee = PaidEquipment.find(paid_equipment_id).fee
            reservation.reserved_equipments.build(paid_equipment_id: paid_equipment_id, fee: equipment_fee)
            total_equipment_fee += equipment_fee
          end
        end
        if reservation.start.wday === (1..5)
          reservation.weekday_judge = true
          reservation.studio_fee_per_hour = reservation.studio.weekday_fee
        else
          reservation.weekday_judge = false
          reservation.studio_fee_per_hour = reservation.studio.weekend_fee
        end
        reservation.total_fee += (reservation.end_at.hour - reservation.start_at.hour) * (reservation.studio_fee_per_hour + total_equipment_fee)
        
        reservation.save
      end
    end

    # p reservation_params
    # p reserved_equipment_params
    # p reservation
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
  
  # def reservation_date_params
    
  # end
end
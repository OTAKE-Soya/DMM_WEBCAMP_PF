class Admins::ContactsController < Admins::ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end
  
  def update
    contact = Contact.find(params[:id])
    if contact.processed_status
      contact.processed_status = false
    else
      contact.processed_status = true
    end
    contact.save!
    redirect_to admins_contacts_path
  end
  
  private
  def contact_params
    params.require(:contact).permit(:status)
  end
end

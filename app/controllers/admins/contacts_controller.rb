class Admins::ContactsController < Admins::ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end
  
  def update
    contact = Contact.find(params[:id])
    contact.process_update
    contact.save!
    redirect_to admins_contacts_path
  end
  
  private
  def contact_params
    params.require(:contact).permit(:status)
  end
end

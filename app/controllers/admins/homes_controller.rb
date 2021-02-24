class Admins::HomesController < Admins::ApplicationController
  def top
    @contacts = Contact.all
  end
end

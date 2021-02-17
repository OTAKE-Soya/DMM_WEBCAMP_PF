class Admins::HomesController < ApplicationController
  def top
    @contacts = Contact.all
  end
end

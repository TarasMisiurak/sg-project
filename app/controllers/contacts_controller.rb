class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		flash.now[:notice] = "Thank you for your message!"
  		redirect_to 'contact'
  	else
  		flash.now[:alert] = "Error sending message!"
  		render :new
  	end
  end

  private

  def contact_params
  	params.require(:contact).permit(:name, :email, :subject, :message, :active)
  end
end

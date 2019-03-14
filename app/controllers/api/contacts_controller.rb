class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render 'index.json.jbuilder'
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    if current_user
      @contact = Contact.new(
        first_name: params[:first_name],
        middle_name: params[:middle_name],
        last_name: params[:last_name],
        email: params[:email],
        phone_number: params[:phone_number],
        bio: params[:bio],
        user_id: current_user.id
        )
      if @contact.save
        render 'show.json.jbuilder'
      else
        render 'errors.json.jbuilder', status: :unprocessable_entity
      end
    else
      render json: []
    end
  end

  def update
    @contact = Contact.find(params[:id])
    updates = {
      first_name: params[:first_name] || @contact.first_name,
      middle_name: params[:middle_name] || @contact.middle_name,
      last_name: params[:last_name]  || @contact.last_name,
      email: params[:email] || @contact.email,
      phone_number: params[:phone_number] || @contact.phone_number,
      bio: params[:bio] || @contact.bio,
      }
    if @contact.update(updates)
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    render 'destroy.json.jbuilder'
  end
end

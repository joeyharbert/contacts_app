class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render 'index.json.jbuilder'
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end
end

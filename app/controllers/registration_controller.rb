class RegistrationController < ApplicationController
  def new
    @user= User.new
    #@contact = Contact.new
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.country_id = params[:user][:country_id]
    @user.state = params[:user][:state]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation =params[:user][:password_confirmation]

    @user.valid?
    if @user.errors.blank?
      @user.save
      redirect_to dashboard_path
    else
      render :action => "new"
    end

    #@contact = Contact.new
    #@contact.mobile = params[:contact][:mobile]
    #@contact.address = params[:contact][:address]
    #@contact.valid?
    #if @contact.errors.blank?
    #  @contact.user = @user
    #  @contact.save
    #  redirect_to dashboard_path
    #else
    # render :action => "new"
    #end
  end
end

class Web::MailApplicationsController < ApplicationController

  def index
    @applications = MailApplication.all
  end

  def show
    @application = MailApplication.find(params[:id])
  end

  def new
    @application = MailApplication.new
  end

  def create
    @application = MailApplication.new(params[:application])

    if @application.save
      redirect_to mail_applications_path
    else
      render :action => :new
    end
  end

  def edit
    @application = MailApplication.find(params[:id])
  end

  def update
    @application = MailApplication.find(params[:id])

    if @application.update_attributes(params[:application])
      redirect_to mail_applications_path
    else
      render :action => :edit
    end
  end

  def destroy
    @application = MailApplication.find(params[:id])

    @application.destroy
    redirect_to mail_applications_path
  end

end
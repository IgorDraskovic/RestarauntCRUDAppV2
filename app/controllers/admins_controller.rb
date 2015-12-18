class AdminsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    Admin.create(admin_params)
    redirect_to log_in_path
  end

  def log_in
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :password)
  end


end

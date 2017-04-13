class MusersController < ApplicationController
  def new
    @muser = Muser.new
  end
  
  def show
    @muser = Muser.find (session[:muser_id])
  end
  
  def create
    @muser = Muser.new(muser_params)
    if @muser.save
      log_in(@muser)
      flash[:success] = "User successfully created"
      redirect_to @muser
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
  end
  
  private
    def muser_params
      params.require(:muser).permit(:name, :email, :password, :password_confirmation)
    end
end

class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def delete
  	@user = User.find(params[:id])
  end

  def destroy
  	user = User.find(params[:id])
    user.destroy
    flash[:notice] = "User '#{user.name}' destroyed successfully!"
    redirect_to(:action => 'index')
  end

  private

  def user_param
    params.require(:subject).permit(:first_name, :last_name, :email, :username, :password_digest)
  end

end

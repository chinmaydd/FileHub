class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_param)
      flash[:notice] = "User data updated succesfully"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def show
  end

  def delete
  	@user = User.find(params[:id])
  end

  def destroy
  	user = User.find(params[:id])
    user.destroy
    flash[:notice] = "User '#{user.username}' destroyed successfully!"
    redirect_to(:action => 'index')
  end

  private

  def user_param
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end

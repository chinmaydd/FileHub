class UsersController < ApplicationController
  
  before_action :confirm_logged_in, :except => [:new, :create] 

  
  def new
    @user = User.new
  end
  

  def create
    @user = User.new(user_param)
    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.username
      flash[:notice] = 'User created.'
      redirect_to(:action => 'index', :controller => 'uploads')
    else
      render("new")
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_param)
      flash[:notice] = "User data updated succesfully"
      redirect_to(:action => 'index', :controller => 'uploads')
    else
      render('edit')
    end
  end

  private

  def user_param
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end

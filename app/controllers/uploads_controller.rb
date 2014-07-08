class UploadsController < ApplicationController
  def index
  	@uploads=Upload.all.sorted
  end


def home
	
end


  def show
  	@upload = Upload.find(params[:id])
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = User.where(:username => params[:username]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end
  	if authorized_user
  		session[:user_id] = authorized_user.id
      	session[:username] = authorized_user.username
  		flash[:notice] = "You are now logged in."
  		redirect_to(:action => 'index')
  	else
  		flash[:notice] = "Invalid username/password combination."
  		redirect_to(:action => 'home')
  	end
  end

end

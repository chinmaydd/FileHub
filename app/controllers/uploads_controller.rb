class UploadsController < ApplicationController

  before_action :confirm_logged_in , :except => [:home,:attempt_login]

  def index
  	@uploads=Upload.all.sorted
  end


  def home
    @uploads=Upload.all.limit(5).sorted
  end


  def show
  	@upload = Upload.find(params[:id])
  end

  def attempt_login
    puts params[:user][:username]+params[:user][:password]
  	if params[:user][:username].present? && params[:user][:password].present?
  		found_user = User.where(:username => params[:user][:username]).first
  		if found_user
        if found_user.authenticate(params[:user][:password])
  			 authorized_user = found_user
        end
  		end
  	end
  	if authorized_user
  		session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
  		flash[:notice] = "You are now logged in."
  		redirect_to(:action => 'index', :controller => 'uploads')
  	else
  		flash[:notice] = "Invalid username/password combination."
  		redirect_to(:action => 'home')
  	end
  end

  def new
    @upload = Upload.new(:name => "default", :description => "your description here")
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.user_id = session[:user_id]
    if @upload.save
      flash[:notice] = "Uploaded successfully!"      
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def delete
    @upload=Upload.find(params[:id])
  end
  
  def destroy
    @upload=Upload.find(params[:id])
    current_user = User.find(session[:user_id]) 
    if current_user.uploads.include?(@upload)
       @upload.destroy
    else 
       flash[:notice] = "Please dont try to delete what doesnt belong to you "
    end
  redirect_to(:action => 'index')
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You are now logged out"
    render("home")
  end

  def download_file
    puts params[:uid]
    upload=Upload.find(params[:uid])
    if upload.user_id != session[:user_id]
      upload.no_of_downloads+=1
    end
    upload.save
    send_file upload.doc.path
  end

  private

  def upload_params
    params.require(:upload).permit(:name, :description, :doc)
  end

end

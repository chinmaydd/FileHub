class UploadsController < ApplicationController

  before_action :confirm_logged_in , :except => [:home,:attempt_login]

  def index
  	@uploads=Upload.all.sorted
  end


  def home
  end


  def show
  	@upload = Upload.find(params[:id])
  end

  def attempt_login
    puts params[:user][:username]+params[:user][:password]
  	if params[:user][:username].present? && params[:user][:password].present?
  		found_user = User.where(:username => params[:user][:username]).first
  		if found_user
        if found_user.password==params[:user][:password]
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
    if @upload.save
      flash[:notice] = "Uploaded successfully!"      
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:name, :description, :doc_file_name, :doc_content_type, :doc_file_size, :doc_updated_at)
  end

end

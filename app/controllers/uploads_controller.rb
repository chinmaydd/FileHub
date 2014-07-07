class UploadsController < ApplicationController
  def index
  	@uploads=Upload.all
  end

  def show
  	@upload = Upload.find(params[:id])
  end
end

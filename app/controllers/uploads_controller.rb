class UploadsController < ApplicationController
  def index
  	@upload=Upload.all
  end

  def show
  	@uploads = Upload.find(params[:id])
  end
end

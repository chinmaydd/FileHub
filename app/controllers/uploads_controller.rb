class UploadsController < ApplicationController
  def index
  end

  def show
  	@upload = Upload.find(params[:id])
  end
end

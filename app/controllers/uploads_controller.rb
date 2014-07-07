class UploadsController < ApplicationController
  def index
  	@uploads=Upload.all
  end

  def show
  	@uploads = Upload.all
  end
end

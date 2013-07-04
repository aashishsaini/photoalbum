class PhotosController < ApplicationController
  before_filter :authenticate_user!

  # used to upload the photos of the gadgets.
  def create
    @gadget = Gadget.find(params[:photo][:gadget_id])
    @photos = @gadget.photos.new(params[:photo])
    respond_to do |format|
      if @photos.save
        format.html { redirect_to @gadget, notice: 'Photo was successfully uploaded.' }
        format.json { render json: @gadget, status: :created, location: @gadget }
      else
        format.html { redirect_to gadget_path(params[:gadget_id]) }
        format.json { render json: @gadget.errors, status: :unprocessable_entity }
      end
    end
  end
end

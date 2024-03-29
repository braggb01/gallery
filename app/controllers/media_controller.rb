class MediaController < ApplicationController
  # GET /media
  # GET /media.json
  def index
    @album = Album.find(params[:album_id])
    @media = @album.media.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media }
    end
  end

  # GET /media/1
  # GET /media/1.json
  def show
    @album = Album.find(params[:album_id])
    @medium = Medium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium }
    end
  end

  def crop
    @album = Album.find(params[:album_id])
    @medium = Medium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium }
    end
  end

  # GET /media/new
  # GET /media/new.json
  # def new
  #   @medium = Medium.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @medium }
  #   end
  # end

  # GET /media/1/edit
  def edit
    @album = Album.find(params[:album_id])
    @medium = Medium.find(params[:id])
  end

  # POST /media
  # POST /media.json
  def create
    @album = Album.find(params[:album_id])
    @medium = @album.media.new(:attachment => params[:file])
    @medium.save!

    respond_to :js

    # respond_to do |format|
    #   if @medium.save
    #     format.html { render :nothing => true }
    #     # format.json { render json: @album, status: :created, location: @album }
    #     format.js
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @medium.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /media/1
  # PUT /media/1.json
  # def update
  #   @medium = Medium.find(params[:id])

  #   respond_to do |format|
  #     if @medium.update_attributes(params[:medium])
  #       format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @medium.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @album = Album.find(params[:album_id])
    @medium = @album.media.find(params[:id])
    @medium.destroy

    respond_to do |format|
      format.html { redirect_to album_path(@album) }
      format.json { head :no_content }
    end
  end
end

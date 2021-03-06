class HarfilesController < ApplicationController
  before_action :set_harfile, only: [:show, :edit, :update, :destroy]

  # GET /harfiles
  # GET /harfiles.json
  def index
    @harfiles = Harfile.all
  end

  # GET /harfiles/1
  # GET /harfiles/1.json
  def show
  end

  # GET /harfiles/new
  def new
    @harfile = Harfile.new
  end

  # GET /harfiles/1/edit
  def edit
  end

  # POST /harfiles
  # POST /harfiles.json
  def create
    @harfile = Harfile.new(harfile_params)

    respond_to do |format|
      if @harfile.save
        format.html { redirect_to @harfile, notice: 'Harfile was successfully created.' }
        format.json { render :show, status: :created, location: @harfile }
      else
        format.html { render :new }
        format.json { render json: @harfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /harfiles/1
  # PATCH/PUT /harfiles/1.json
  def update
    respond_to do |format|
      if @harfile.update(harfile_params)
        format.html { redirect_to @harfile, notice: 'Harfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @harfile }
      else
        format.html { render :edit }
        format.json { render json: @harfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /harfiles/1
  # DELETE /harfiles/1.json
  def destroy
    @harfile.destroy
    respond_to do |format|
      format.html { redirect_to harfiles_url, notice: 'Harfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_harfile
      @harfile = Harfile.find(params[:id])
    end

    def harfile_params
      params.require(:harfile).permit(:name).merge(
        contents: utf8_data
      )
    end

    def content_tempfile
      params['harfile']['contents'].try(:tempfile)
    end

    def utf8_data
      return nil if content_tempfile.blank?
      # return content_tempfile.read # this way fails
      File.open(content_tempfile.path, 'r:UTF-8', &:read)
    end
end

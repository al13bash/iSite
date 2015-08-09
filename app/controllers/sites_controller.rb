class SitesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all
    authorize! :index, @site
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
  end

  # GET /sites/new
  def new
    @site = Site.new
    authorize! :new, @site
  end

  # GET /sites/1/edit
  def edit
    authorize! :edit, @site
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to site_path(@site.id), notice: t('.created') }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
    authorize! :create, @site
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    @site.components.each do |component|
      component.position = params[:position][component.id.to_s]
      component.save
    end
    
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to site_path(@site.id), notice: t('.updated') }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
    authorize! :update, @site
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: t('.destroyed') }
      format.json { head :no_content }
    end
    authorize! :destroy, @site
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:id, :user_id)
    end
end

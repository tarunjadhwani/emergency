class Admin::AmbulancesController < ApplicationController
  before_action :set_ambulance, only: [:show, :edit, :update, :destroy]

  # GET /ambulances
  # GET /ambulances.json
  def index
    @ambulances = Ambulance.all
  end

  # GET /ambulances/1
  # GET /ambulances/1.json
  def show
  end

  # GET /ambulances/new
  def new
    @ambulance = Ambulance.new
  end

  # GET /ambulances/1/edit
  def edit
  end

  # POST /ambulances
  # POST /ambulances.json
  def create
    @ambulance = Ambulance.new(ambulance_params)

    respond_to do |format|
      if @ambulance.save
        format.html { redirect_to [:admin, @ambulance], notice: 'Ambulance was successfully created.' }
        format.json { render :show, status: :created, location: @ambulance }
      else
        format.html { render :new }
        format.json { render json: @ambulance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ambulances/1
  # PATCH/PUT /ambulances/1.json
  def update
    respond_to do |format|
      if @ambulance.update(ambulance_params)
        format.html { redirect_to @ambulance, notice: 'Ambulance was successfully updated.' }
        format.json { render :show, status: :ok, location: @ambulance }
      else
        format.html { render :edit }
        format.json { render json: @ambulance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ambulances/1
  # DELETE /ambulances/1.json
  def destroy
    @ambulance.destroy
    respond_to do |format|
      format.html { redirect_to ambulances_url, notice: 'Ambulance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ambulance
      @ambulance = Ambulance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ambulance_params
      params[:ambulance]
    end
end

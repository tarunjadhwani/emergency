class Admin::HospitalsController < ApplicationController
  before_action :set_admin_hospital, only: [:show, :edit, :update, :destroy]

  # GET /admin/hospitals
  def index
    @search_admin_hospitals = Hospital.order(created_at: :desc).ransack(params[:q])
    @admin_hospitals = @search_admin_hospitals.result(distinct: true).page(params[:page])
  end

  # GET /admin/hospitals/1
  def show
  end

  # GET /admin/hospitals/new
  def new
    @admin_hospital = Hospital.new
  end

  # GET /admin/hospitals/1/edit
  def edit
  end

  # POST /admin/hospitals
  def create
    @admin_hospital = Hospital.new(admin_hospital_params)

    if @admin_hospital.save
      redirect_to [:admin, @admin_hospital], notice: 'Hospital was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/hospitals/1
  def update
    if @admin_hospital.update(admin_hospital_params)
      redirect_to [:admin, @admin_hospital], notice: 'Hospital was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/hospitals/1
  def destroy
    @admin_hospital.destroy
    redirect_to admin_hospitals_url, notice: 'Hospital was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_hospital
      @admin_hospital = Hospital.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_hospital_params
      params.require(:hospital).permit(:name, :phone, :address, :contact_name, :rating, :lat, :long)
    end
end

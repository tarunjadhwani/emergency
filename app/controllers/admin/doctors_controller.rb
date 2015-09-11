class Admin::DoctorsController < ApplicationController
  before_action :set_admin_doctor, only: [:show, :edit, :update, :destroy]

  # GET /admin/doctors
  def index
    @admin_doctors = Doctor.all
  end

  # GET /admin/doctors/1
  def show
  end

  # GET /admin/doctors/new
  def new
    @admin_doctor = Doctor.new
  end

  # GET /admin/doctors/1/edit
  def edit
  end

  # POST /admin/doctors
  def create
    @admin_doctor = Doctor.new(admin_doctor_params)

    if @admin_doctor.save
      redirect_to @admin_doctor, notice: 'Doctor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/doctors/1
  def update
    if @admin_doctor.update(admin_doctor_params)
      redirect_to @admin_doctor, notice: 'Doctor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/doctors/1
  def destroy
    @admin_doctor.destroy
    redirect_to admin_doctors_url, notice: 'Doctor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_doctor
      @admin_doctor = Doctor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_doctor_params
      params[:admin_doctor]
    end
end

class RequestsController < ApplicationController
  before_action :set_request, only: [:new_address, :update, :new_symptom, :allocate_ambulance, :allocate_doctor, :precautions]

  def new_hospital

  end

  def new_ambulance
    @request = Request.new
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to new_address_path(@request)
    else
    end
  end

  def new_address

  end

  def update
    if @request.update(request_params)
      redirect_to new_symptom_path(@request)
    else
    end
  end

  def new_symptom

  end

  def allocate_ambulance
    if [false, false, true].sample
      offset = rand(Ambulance.count)
      rand_ambulance = Ambulance.offset(offset).first
      @request.update(ambulance: rand_ambulance)
    end
  end

  def allocate_doctor
    if [false, false, true].sample
      offset = rand(Doctor.count)
      rand_doctor = Doctor.offset(offset).first
      @request.update(doctor: rand_doctor)
    end
  end

  def precautions
    @precautions = @request.diseases.first.precautions
  end

  private

    def set_request
      @request = Request.find(params[:id] || params[:request_id])
    end

    def request_params
      params.require(:request).permit(:mobile, :address, :lat, :long, :ambulance_id, :hospital_id, :doctor_id, :book)
    end

end
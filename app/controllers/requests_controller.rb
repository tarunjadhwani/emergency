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
    @diseases = Disease.all
    @symptoms = Symptom.all
    @featured_diseases = Disease.where(featured: true)
  end

  def symptom_options
    selected_symptom_ids = params[:symptom_ids].uniq
    selected_symptom_objects = Symptom.find(selected_symptom_ids)
    @options = []
    selected_symptom_objects.each do |symptom|
      symptom.diseases.each do |disease|
        @options << disease.symptoms.where.not(id: symptom.id)
      end
    end
    respond_to do |format|
      format.json { render :json => [@options.flatten] }
    end
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
    if params[:disease_id]
      @request.diseases << Disease.find(params[:disease_id])
    end
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
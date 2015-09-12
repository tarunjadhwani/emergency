class RequestsController < ApplicationController
  before_action :set_request, only: [:new_address, :update, :new_symptom, :allocate_ambulance, :precautions]

  def new_hospital
    session['step'] = "hospital"
  end

  def new_ambulance
    @request = Request.new
  end

  def new
    @request = Request.new
    session['step'] = "doctor"
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      session["request_id"] = @request.id
      redirect_to new_address_path(@request)
    else
    end
  end

  def new_address

  end

  def update
    location = Geocoder.search(request_params["address"])
    
    if @request.update(request_params)
      begin
        @request.lat = location[0].latitude
        @request.long = location[0].longitude
        @request.save!
      rescue
      end
      if session['step'] == "hospital"
        redirect_to new_symptom_path(@request)
      else
        redirect_to doctor_path()
      end
    else
    end
  end

  def doctorMap
    request = Request.find(session["request_id"])
    @lat = request.lat
    @long = request.long
  end

  def doctorRequest
    request = Request.find(session["request_id"])
    doctors = Doctor.all
    @doctors_all = []
    index = 0
    doctors.each do |doctor|
      begin
        x = Geocoder::Calculations.distance_between([request.lat,request.long], [doctor.lat,doctor.long])
        if x.to_i < 10 && index < 6
          @doctors_all[index] = doctor
          index = index+1
        end
      rescue
      end
    end
    respond_to do |format|
      format.json { render :json => [@doctors_all.flatten] }
    end
  end

  def doctorSelected
    @request = Request.find(session["request_id"])
  end

  def doctorListing
    request = Request.find(session["request_id"])
    doctors = Doctor.all
    @doctors_all = []
    @distance = []
    index = 0
    doctors.each do |doctor|
      begin
        x = Geocoder::Calculations.distance_between([request.lat,request.long], [doctor.lat,doctor.long])
        if x.to_i < 3 && index < 6
          @doctors_all[index] = doctor
          @distance[index] = x.to_f*1.8
          index = index+1
        end
      rescue
      end
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
    session["request_id"]
    @request = Request.find(session["request_id"])
    doctors = Doctor.all
    @doctors_all = []
    index = 0
    doctors.each do |doctor|
      begin
        x = Geocoder::Calculations.distance_between([@request.lat,@request.long], [doctor.lat,doctor.long])
        if x.to_i < 3 && index < 6
          @doctors_all[index] = doctor
          index = index+1
        end
      rescue
      end
    end
    index = index - 1
    random = rand(0...index)
    @request.update(doctor: @doctors_all[random])
    respond_to do |format|
      format.json { render :json => [@request] }
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
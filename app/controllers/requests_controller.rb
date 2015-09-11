class RequestsController < ApplicationController
  before_action :set_request, only: [:new_address, :update, :new_symptom]

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

  private

    def set_request
      @request = Request.find(params[:id] || params[:request_id])
    end

    def request_params
      params.require(:request).permit(:mobile, :address, :lat, :long, :ambulance_id, :hospital_id, :doctor_id, :book)
    end

end
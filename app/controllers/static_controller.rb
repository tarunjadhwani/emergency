class StaticController < ApplicationController
  def index
  end

  def doctorNextStep
    session['step'] = "doctor"
  end

  def hospitalNextStep
    session['step'] = "hospital"
  end

  def doctorAddress
  end

  def patientCondition
  end
  
end

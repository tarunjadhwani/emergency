class StaticController < ApplicationController
  def index
  end

  def doctorNextStep
  end

  def hospitalNextStep
  end

  def doctorAddress
  end

  def patientCondition
  end

  def doctorMap
  end

  def doctorSelected
  end

  def symptom_options
    selected_symptom_ids = params[:symptom_ids]
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

end

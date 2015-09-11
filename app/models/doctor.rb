class Doctor < ActiveRecord::Base
  validates_presence_of :name, :mobile

  def doctor_type
    case type
    when 'Nurse'
      'Nurse'
    when 'CprExpert'
      'CPR Expert'
    when 'ResidentDoctor'
      'Resident Doctor'
    when 'ErDoctor'
      'ER Doctor'
    end
  end
end

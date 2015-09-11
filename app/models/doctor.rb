# == Schema Information
#
# Table name: doctors
#
#  id              :integer          not null, primary key
#  name            :string(255)      default(""), not null
#  mobile          :string(255)      default(""), not null
#  address         :text(65535)
#  recommendations :integer
#  lat             :decimal(10, 6)
#  long            :decimal(10, 6)
#  type            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

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

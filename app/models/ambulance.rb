# == Schema Information
#
# Table name: ambulances
#
#  id                  :integer          not null, primary key
#  vendor_name         :string(255)
#  registration_number :string(255)
#  mobile              :string(255)
#  driver_name         :string(255)
#  type                :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Ambulance < ActiveRecord::Base
  validates_presence_of :vendor_name, :registration_number, :driver_name, :mobile
  has_and_belongs_to_many :requests
end

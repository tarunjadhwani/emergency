# == Schema Information
#
# Table name: requests
#
#  id           :integer          not null, primary key
#  mobile       :string(255)
#  address      :text(65535)
#  lat          :string(255)
#  long         :string(255)
#  ambulance_id :integer
#  hospital_id  :integer
#  doctor_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  book         :boolean          default(FALSE), not null
#

class Request < ActiveRecord::Base
  belongs_to :ambulance
  belongs_to :doctor
  belongs_to :hospital

  # has_and_belongs_to_many :ambulances
  has_and_belongs_to_many :symptoms
  has_and_belongs_to_many :diseases

  validates_presence_of :mobile
end

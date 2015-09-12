# == Schema Information
#
# Table name: symptoms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Symptom < ActiveRecord::Base
  validates_presence_of :name
  has_and_belongs_to_many :requests
  has_and_belongs_to_many :diseases
end

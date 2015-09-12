# == Schema Information
#
# Table name: diseases
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  featured   :boolean          default(FALSE), not null
#

class Disease < ActiveRecord::Base
  validates_presence_of :name
  has_and_belongs_to_many :requests
  has_and_belongs_to_many :symptoms
  has_and_belongs_to_many :precautions
end

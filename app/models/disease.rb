# == Schema Information
#
# Table name: diseases
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Disease < ActiveRecord::Base
  validates_presence_of :name
  has_and_belongs_to_many :requests
end

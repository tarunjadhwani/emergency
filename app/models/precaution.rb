# == Schema Information
#
# Table name: precautions
#
#  id          :integer          not null, primary key
#  description :text(65535)
#  video_url   :string(255)
#  image_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  disease_id  :integer
#

class Precaution < ActiveRecord::Base
  validates_presence_of :description
  has_and_belongs_to_many :diseases
end

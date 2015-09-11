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
#

class Precaution < ActiveRecord::Base
  validates_presence_of :description
end

# == Schema Information
#
# Table name: specialities
#
#  id          :integer          not null, primary key
#  name        :string(255)      default(""), not null
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Speciality < ActiveRecord::Base
end

# == Schema Information
#
# Table name: hospitals
#
#  id           :integer          not null, primary key
#  name         :string(255)      default(""), not null
#  phone        :string(255)      default(""), not null
#  address      :text(65535)
#  contact_name :string(255)
#  lat          :decimal(10, 6)
#  long         :decimal(10, 6)
#  rating       :decimal(4, 2)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Hospital < ActiveRecord::Base
  validates_presence_of :name, :phone, :address
end

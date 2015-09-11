class Request < ActiveRecord::Base
  has_and_belongs_to_many :ambulances
  has_and_belongs_to_many :symptoms
  has_and_belongs_to_many :diseases
end

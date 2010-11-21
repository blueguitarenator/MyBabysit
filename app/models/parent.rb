class Parent < ActiveRecord::Base
  has_many :events
  has_and_belongs_to_many :babysitters
  validates_presence_of :email
  
end

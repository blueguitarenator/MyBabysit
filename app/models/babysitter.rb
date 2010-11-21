class Babysitter < ActiveRecord::Base
  has_many  :replies
  has_and_belongs_to_many :parents
  validates_presence_of :email
  
end

class Babysitter < ActiveRecord::Base
  
  has_many  :replies
  has_and_belongs_to_many :parents
  validates_presence_of :email
  
  def get_parents(email)
    Babysitter.find_by_email(email).parents
  end
  
  def add_parent(parent, email)
    parents = get_parents(email)
    parents << parent
  end
  
end

class User < ActiveRecord::Base
  acts_as_authentic
  validates_presence_of :first_name, :last_name, :email
  has_and_belongs_to_many :friends,
                            :class_name => "User",
                            :join_table => "users_friends",
                            :foreign_key => "user_id",
                            :association_foreign_key => "friend_id",
                            :after_add => :create_reverse_association,
                            :after_remove => :remove_reverse_association
                     
  has_many  :replies

  validates_presence_of :email
  validates_uniqueness_of :email
 
  has_many :events
  
  def invite_email
    @invite_email
  end
       
  def add_friend(friend)
    self.friends << friend unless self.friends.include?(friend) || friend == self
  end
  
  def accept_friend(friend)
    sql = User.sanitize(["UPDATE users_friends SET friends_since = ?, accepted = ? WHERE member_id = ? AND friend_id = ?", Time.now(), 1, self.id, friend].flatten)
    self.connection.update(sql, "Accept Friend")
  end
  
  def known_friends
    self.friends
  end
  
  def full_name
    name = first_name + " " + last_name
  end
  
  private
  def create_reverse_association(associated_user)
    associated_user.known_friends << self unless associated_user.known_friends.include?(self)
  end
  def remove_reverse_association(associated_user)
    associated_user.known_friends.delete(self) if associated_user.known_friends.include?(self)
  end
  
end

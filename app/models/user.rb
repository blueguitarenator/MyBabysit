class User < ActiveRecord::Base
  acts_as_authentic
  validates_presence_of :first_name, :last_name, :email
  has_and_belongs_to_many :friends,
                            :class_name => "User",
                            :join_table => "users_friends",
                            :foreign_key => "user_id",
                            :association_foreign_key => "friend_id"
                     
  has_many  :replies

  validates_presence_of :email
  validates_uniqueness_of :email
 
  has_many :events
       
  def add_friend(friend)
    self.friends << friend unless self.friends.include?(friend) || friend == self
  end
  
  def accept_friend(friend)
    sql = User.sanitize(["UPDATE users_friends SET friends_since = ?, accepted = ? WHERE member_id = ? AND friend_id = ?", Time.now(), 1, self.id, friend].flatten)
    self.connection.update(sql, "Accept Friend")
  end
end

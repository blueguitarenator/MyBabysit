class Event < ActiveRecord::Base
  named_scope :historic, lambda {|date| {
    :order => 'eventDate DESC', 
    :conditions => ["eventDate < ?", date]}}
      
  named_scope :upcoming, lambda {|date| {
    :order => 'eventDate ASC', 
    :conditions => ["eventDate >= ?", date]}}
  
  belongs_to :user
  has_many :replies
  validates_presence_of :eventDate
  validates_presence_of :startTime
  validates_presence_of :endTime
  
  @sitter_name
  
  def sitter_name(status)
    replies.each do |r|
      if (r.answer.downcase == status.downcase)
        @sitter_name = r.user.first_name + " " + r.user.last_name
      end
    end
    @sitter_name
  end
  
  def covered
    replies.each do |r|
      if (r.answer.downcase == 'yes')
        return true
      end
    end
    return false
  end
  
  def pending
    replies.each do |r|
      if (r.answer.downcase == '<none>')
        return true
      end
    end
    return false
  end
  
  def event_date_formatted
     eventDate.strftime '%Y-%m-%d'
  end
end

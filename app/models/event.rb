class Event < ActiveRecord::Base
  named_scope :historic, lambda {|date| {:conditions => ["eventDate < ?", date]}}  
  named_scope :upcoming, lambda {|date| {:conditions => ["eventDate >= ?", date]}}
  
  belongs_to :user
  has_many :replies
  validates_presence_of :eventDate
  validates_presence_of :startTime
  validates_presence_of :endTime
  
  @sitter_name
  
  def sitter_name
    replies.each do |r|
      if (r.answer == 'Yes')
        @sitter_name = r.user.first_name + " " + r.user.last_name
      end
    end
    @sitter_name
  end
end

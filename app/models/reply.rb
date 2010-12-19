class Reply < ActiveRecord::Base
#  named_scope :historic, :joins => :event, lambda {|date| {:conditions => ['event.eventDate < ?', date]}}
#  named_scope :historic, lambda {|date| {:conditions => ["event.eventDate < ?", date]}}  
#  named_scope :upcoming, :joins => :event, lambda {|date| {:conditions => ["event.eventDate >= ?", date]}}

named_scope :historic, lambda { |date| { :joins => :event, 
              :order => 'eventDate DESC', 
              :conditions => ['eventDate < ?', date]}}
named_scope :upcoming, lambda { |date| { :joins => :event, 
              :order => 'eventDate DESC', 
              :conditions => ['eventDate >= ?', date]}}
                
  belongs_to :user
  belongs_to :event
  
end

class Reply < ActiveRecord::Base
  belongs_to :babysitter
  belongs_to :event
end

class Event < ActiveRecord::Base
  belongs_to :parent
  has_many :reply
end

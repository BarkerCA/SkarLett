class Message < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :subject
  validates_presence_of :memo
end
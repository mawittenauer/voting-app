class Campaign < ActiveRecord::Base
  validates_presence_of :title
  has_many :sides
  has_many :votes
  has_many :comments
end

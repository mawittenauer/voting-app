class Campaign < ActiveRecord::Base
  validates_presence_of :title
  has_many :sides
end

class Side < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :campaign
end

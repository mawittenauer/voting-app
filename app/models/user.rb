class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :full_name, :email
  has_many :votes
  
  def can_vote?(campaign)
    !votes.map{ |vote| vote.campaign }.include?(campaign)
  end
end

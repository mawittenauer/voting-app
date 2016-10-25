class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :full_name, :email
  has_many :votes
  validates_uniqueness_of :email, :case_sensitive => false
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX }
  
  def can_vote?(campaign)
    !votes.map{ |vote| vote.campaign }.include?(campaign)
  end
end

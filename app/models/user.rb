class User < ActiveRecord::Base
  attr_accessor :activation_token
  before_create :create_activation_digest
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
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  private
  
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end

class User < ApplicationRecord
  attr_accessor :share_token_plain
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def send_share_email
    UserMailer.share_calories(self).deliver_now
  end
  
  def generate_token(column)
    
  end
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Sets the password reset attributes.
  def create_share_digest
    self.share_token_plain = User.new_token
    update_attribute(:share_token,  Digest::MD5.hexdigest(share_token_plain))
    update_attribute(:share_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  def authenticated?(remember_token)
    digest = self.send("remember_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(remember_token)
  end
end

class User < ActiveRecord::Base
  validates :firstName, presence: true, length: {maximum:20}
  validates :lastName, presence: true, length: {maximum:20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness:{case_sensitive:false}
  validates :mobile, presence:true, format: { with: /\A[0-9]{3}-[0-9]{3}-[0-9]{3}\Z/ },uniqueness:{case_sensitive:false}
  VALID_TWITTER_REGEX = /\A[A-Za-z0-9_]{1,15}\z/i

  validates_format_of :twitter,
  :with => VALID_TWITTER_REGEX,
  :allow_blank => true,
  :allow_nil => true
end

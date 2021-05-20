class User < ApplicationRecord
  before_save { self.email = email.downcase}
  
  has_many :articles
  validates :username, uniqueness: {case_sensitive: false}, presence:true ,length: { minimum: 3,maximum: 18}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,presence:true,uniqueness: {case_sensitive: false},length: { maximum: 105},format: {with: VALID_EMAIL_REGEX}
  has_secure_password
end
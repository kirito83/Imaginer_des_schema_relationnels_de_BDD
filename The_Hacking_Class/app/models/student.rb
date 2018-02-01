class Student < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :pseudonyme, presence: true, uniqueness: true,
				length: { in: 4...12 }
	validates :first_name, presence: true, length: { in: 2...50 }
	validates :last_name, presence: true, length: { in: 2...50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255}, 
	                  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { in: 8...50 }               
	belongs_to :cours
	has_secure_password
end

class Contact < ActiveRecord::Base
	VALID_USERNAME = /\A[a-zA-Z0-9]+\z/
	validates :name, presence: true, length: { minimum: 2, maximum: 30 },
									format: { with: VALID_USERNAME },
									uniqueness: { case_sensitive: false }
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
	validates :email, presence: true, length: { maximum: 255},
									format: { with: VALID_EMAIL },
									uniqueness: { case_sensitive: false }
	validates :subject, presence: true, length: { minimum: 2, maximum: 100 },
										uniqueness: { case_sensitive: false }
	validates :message, presence: true
end

class Post < ActiveRecord::Base
	resourcify
	validates :title, presence: true
	validates :body, presence: true
end

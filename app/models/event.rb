class Event < ActiveRecord::Base
	resourcify
	validates :title, presence: true
	validates :desc, presence: true
end

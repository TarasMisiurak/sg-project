class Event < ActiveRecord::Base
	validates :title, presence: true
	validates :desc, presence: true
end

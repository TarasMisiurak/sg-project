class Vacancy < ActiveRecord::Base
	resourcify
	validates :title, presence: true
	validates :desc, presence: true
	validates :requirements, presence: true

	def self.search(search)
	  where("title ILIKE ?", "%#{search}%") 
	end
end

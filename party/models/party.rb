class Party < ActiveRecord::Base
	has_many :attendees

	def to_s
		"#{self.name},#{self.adress},#{self.coordinates},#{self.date_time}\n" 
	end
end
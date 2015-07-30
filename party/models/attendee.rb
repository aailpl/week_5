class Attendee < ActiveRecord::Base
	belongs_to :parties 
	validates_uniqueness_of :email, scope: :party_id
	def to_s
		"#{self.name}\n" 
	end
end
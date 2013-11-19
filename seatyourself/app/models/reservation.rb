class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validates_numericality_of :guests
	validates_numericality_of :time_slot

end

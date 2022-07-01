class Activity < ApplicationRecord
	has_many :signups,
	# dependent :signups
	has_many :campers, through: :signups
end

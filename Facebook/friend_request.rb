class FriendRequest
	attr_reader :from
	attr_reader :to

	def initialize(from, to)
		@from = from
		@to = to
	end

	def to_s
		"from #{from} to #{to}"
	end
end
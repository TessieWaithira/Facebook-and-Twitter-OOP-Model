class Comment < Post
	attr_reader :parent
	attr_reader :comments
	attr_reader :likes
	
	def initialize(message, author, date, parent)
		@message = message
		@author = author
		@date = date
		@parent = parent

		@comments = []
		@likes = []
	end


	def to_s()
		result = ""
		result += "#{@author} (#{@date})\n"
		result += "#{@message}\n"
		result += "#{@likes.length} likes\n"
		if comments.length > 0
			result += "\t------------------\n"
			@comments.each { |comment|
				result += "\t"
				result += comment.to_s
			}
		end
		result
	end
end
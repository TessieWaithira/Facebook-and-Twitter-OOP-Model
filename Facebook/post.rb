class Post
	attr_reader :message
	attr_reader :author
	attr_reader :date
	attr_reader :comments
	attr_reader :likes

	def initialize(message, author, date)
		@message = message
		@author = author
		@date = date

		@comments = []
		@likes = []
	end


	def to_s()
		result = ""
		result += "#{@author} (#{@date})\n"
		result += "#{@message}\n"
		result += "#{@likes.length} likes\n"
		result += "\n\n"
		if comments.length > 0
			result += "\tComments:\n"
			result += "\t----------------------------------\n"
			@comments.each { |comment|
				result += "\t"
				result += comment.to_s
			}
		end
		result
	end
end
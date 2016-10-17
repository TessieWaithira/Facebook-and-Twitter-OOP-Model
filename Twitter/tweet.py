class Tweet(object):
	
	def __init__(message, author, date)
		self.message = message
		self.author = author
		self.date = date

		self.replies = []
		self.likes = []


	def __str__()
		result = ""
		result += "{} ({})\n".format(self.author, self.date)
		result += "{}\n".format(self.message)
		result += "{} likes\n".format(self.like.length)
		result += "\n\n"
		if replies.length > 0:
			result += "\tReplies:\n"
			result += "\t----------------------------------\n"

			for reply in replies:
				result += "\t"
				result += str(reply)

		return result
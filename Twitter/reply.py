from tweet import Tweet

class Reply(Tweet):
	
	def __init__(message, author, date, parent):
		self.message = message
		self.author = author
		self.date = date
		self.parent = parent

		self.replies = []
		self.likes = []


	def __str__():
		result = ""
		result += "{} ({})\n".format(self.author, self.date)
		result += "{}\n".format(self.message)
		result += "{} likes\n".format(self.likes.length)
		if replies.length > 0:
			result += "\t------------------\n"
			for reply in replies:
				result += "\t"
				result += reply.to_s

		return result
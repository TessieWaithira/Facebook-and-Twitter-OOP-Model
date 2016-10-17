class Tweet(object):
	
	def __init__(self, message, author, date):
		self.message = message
		self.author = author
		self.date = date

		self.replies = []
		self.likes = []


	def __str__(self):
		result = ""
		result += "{} ({})\n".format(self.author, self.date)
		result += "{}\n".format(self.message)
		result += "{} likes\n".format(len(self.likes))
		result += "\n\n"
		if len(self.replies) > 0:
			result += "\tReplies:\n"
			result += "\t----------------------------------\n"

			for reply in self.replies:
				result += "\t"
				result += str(reply)

		return result
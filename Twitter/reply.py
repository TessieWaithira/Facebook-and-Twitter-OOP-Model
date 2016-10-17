from tweet import Tweet

class Reply(Tweet):
	
	def __init__(self, message, author, date, parent):
		self.message = message
		self.author = author
		self.date = date
		self.parent = parent

		self.replies = []
		self.likes = []


	def __str__(self):
		result = ""
		result += "{} ({})\n".format(self.author, self.date)
		result += "{}\n".format(self.message)
		result += "{} likes\n".format(len(self.likes))
		if len(self.replies) > 0:
			result += "\t------------------\n"
			for reply in self.replies:
				result += "\t"
				result += str(reply)

		return result
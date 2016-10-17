class FollowRequest(object):

	def __init__(requester, requestee):
		self.requester = requester
		self.requestee = requestee

	def __str__():
		return "from {} to {}".format(self.requester, self.requestee)
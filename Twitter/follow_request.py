class FollowRequest(object):

	def __init__(self, requester, requestee):
		self.requester = requester
		self.requestee = requestee

	def __str__(self):
		return "from {} to {}".format(self.requester, self.requestee)
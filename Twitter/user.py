# import set
from follow_request import FollowRequest
from tweet import Tweet
from reply import Reply
from datetime import datetime


class User(object):

  def __init__(self, username, email, firstname, lastname):
    self.username = username
    self.email = email
    self.firstname = firstname
    self.lastname = lastname

    self.follows = set()
    self.follow_requests = set()
    self.tweets = []

    print("Created {0}".format(self))

  def __str__(self):
    return "{}".format(self.username)


  def fullname(self):
    return "{} {}".format(self.firstname,  self.lastname)


  def send_follow_request(self, other):
    request = FollowRequest(self,  other)

    other.follow_requests.add(request)
    print( "Sending follow request to {} ...".format(other))

  def accept_follow_requests(self):
    requests = self.list_follow_requests()
    
    while True:
      print( "press request number e.g. '0' to accept request")
      print("or press 'a' to accept all: ")
      answer = input()
      if answer == 'a':
        # accept all follow requests
        for request in  requests:
          new_follow = request.requester
          new_follow.follows.add(self)
          self.follows.add(new_follow)

        print( "Accepted {} requests".format(len(requests)))
        break
      elif int(answer) >= 0 and int(answer) < len(self.follow_requests):
        # accept particular request
        new_follow = requests[int(answer)].requester
        new_follow.follows.add(self)
        self.follows.add(new_follow)

        print( "Accepted follow request from {}".format(new_follow))
        print( "press any key to continue or 'n' to exit")
        should_continue = input()
        if should_continue.lower() == 'n':
          break
     
      else:
        print( "invalid answer!")
   
 

  def unfollow(self, other):
    if other in self.follows:
      self.follows.remove(other)
      other.follows.remove(self)
      print( "{} unfollowed {} ...".format(self, other))
    else:
      print( "{} can't unfollow {} because they were not follows in the first place ...".format(self, other))
 

  def list_follows(self):
    print()
    print("Hi {}!".format(self))
    print("The following people are your follows:")
    print("---------------------------------------------------")
    for value in self.follows:
      print("{}".format(value))

    print("---------------------------------------------------")
    print()

  def list_follow_requests(self):
    requests = list(self.follow_requests)
    print()
    print( "Hi {}!".format(self.firstname))
    print( "The following people want to be follows with you:")
    print( "---------------------------------------------------")
    for index, value in  enumerate(requests):
        print( "{}: {}".format(index, value))
    print( "---------------------------------------------------")
    print()
    return requests



  def create_tweet(self, message):
    tweet = Tweet(message, self,  datetime.now())
    self.tweets.append(tweet)
    return tweet

  def list_tweets(self):
    print()
    print( "Hi {}!".format(self.firstname))
    print( "Here are all your tweets:")
    print( "---------------------------------------------------")
    for tweet in  self.tweets:
      print( "{}".format(tweet))
      print()

    print( "---------------------------------------------------")
    print()
    return self.tweets


  def view_feed(self):
    # objects.sort_by {|obj| obj.attribute}
    # get all tweets
     # filter by tweets of people you're follows with
      # sort by date (latest first)

    feed = []
    feed.extend(self.tweets)

    for follow in  self.follows:
      feed.extend(follow.tweets)


    feed.sort(key=lambda tweet: tweet.date, reverse=True)

    print()
    print("Hi {}!".format(self.firstname))
    print("Here is your feed for today:")
    print("---------------------------------------------------")
    for tweet in feed:
      print("{}".format(tweet))
      print()

    print("---------------------------------------------------")
    print()
    return feed


  def create_reply(self, message, parent):
    reply = Reply(message, self,  datetime.now(), parent)
    parent.replies.append(reply)
    return reply
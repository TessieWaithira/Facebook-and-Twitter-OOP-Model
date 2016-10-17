$LOAD_PATH << '.'

require 'set'
require 'user'
require 'follow_request'
require 'tweet'
require 'reply'


class User(object):

  def __init__(username, email, firstname, lastname):
    self.username = username
    self.email = email
    self.firstname = firstname
    self.lastname = lastname

    self.follows = Set.new
    self.follow_requests = Set.new
    self.tweets = []

    print("Created {0}".format(self))

  def __str__:
    return "{}".format(self.username)


  def fullname():
    return "{} {}".format(self.firstname,  self.lastname)


  def send_follow_request(other):
    request = followRequest.new(self, other)

    other.follow_requests.add(request)
    print( "Sending follow request to {other} ...".format(other))

  def accept_follow_requests():
    requests = list_follow_requests
    
    while true
      print( "press request number e.g. '0' to accept request")
      print "or press 'a' to accept all: "
      answer = input()
      if answer == 'a'
        # accept all follow requests
        requests.each { |request|
          new_follow = request.requester
          new_follow.follows.add(self)
          self.follows.add(new_follow)
        }
        print( "Accepted {requests.length} requests".format(self.))
        break
      elsif answer.to_i >= 0 && answer.to_i < follow_requests.length
        # accept particular request
        new_follow = requests[answer.to_i].requester
        new_follow.follows.add(self)
        self.follows.add(new_follow)

        print( "Accepted follow request from {new_follow}".format(self.))
        print( "press any key to continue or 'n' to exit")
        should_continue = input()
        if should_continue.downcase == 'n'
          break
     
      else
        print( "invalid answer!")
   
 

  def unfollow(other):
    if self.follows.include? other
      self.follows.delete(other)
      other.follows.delete(self)
      print( "{self} unfollowed {other} ...".format(self.))
    else
      print( "{self} can't unfollow {other} because they were not follows in the first place ..."     .format(self.))
 

  def list_follows:
    print()
    print( "Hi {self.firstname}!".format(self.))
    print( "The following people are your follows:")
    print( "---------------------------------------------------")
    self.follows.each_entry { |value|
      print( " {value}".format(self.))
    }
    print( "---------------------------------------------------")
    print()

  def list_follow_requests():
    requests = self.follow_requests.to_a
    print()
    print( "Hi {self.firstname}!".format(self.))
    print( "The following people want to be follows with you:")
    print( "---------------------------------------------------")
    requests.each_with_index { |value, index|
      print( "{index}: {value}".format(self.))
    }
    print( "---------------------------------------------------")
    print()
    requests



  def create_tweet(message):
    tweet = tweet.new(message, self, Time.now)
    self.tweets.push(tweet)
    tweet

  def list_tweets() #Users wall:
    print()
    print( "Hi {self.firstname}!".format(self.))
    print( "Here are all your tweets:")
    print( "---------------------------------------------------")
    self.tweets.each { |tweet|
      print( "{tweet}".format(self.))
      print()
    }
    print( "---------------------------------------------------")
    print()
    self.tweets


  def view_feed():
    # objects.sort_by {|obj| obj.attribute}
    # get all tweets
     # filter by tweets of people you're follows with
      # sort by date (latest first)

    feed = []
    feed.concat(self.tweets)

    self.follows.each { |follow|
      feed.concat(follow.tweets)
    }

    feed = feed.sort_by {|tweet| tweet.date}

    print()
    print( "Hi {self.firstname}!".format(self.))
    print( "Here is your feed for today:")
    print( "---------------------------------------------------")
    feed.each { |tweet|
      print( "{tweet}".format(self.))
      print()
    }
    print( "---------------------------------------------------")
    print()
    return feed


  def create_reply(message, parent):
    reply = Reply.new(message, self, Time.now, parent)
    # print( parent)
    print( parent.class)
    parent.replies.push(reply)
    return reply
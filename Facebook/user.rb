$LOAD_PATH << '.'

require 'set'
require 'user'
require 'friend_request'
require 'post'
require 'comment'


class User

  attr_reader :username
  attr_reader :email
  attr_reader :firstname
  attr_reader :lastname
  attr_reader :friends
  attr_reader :friend_requests
  attr_reader :posts


  def initialize(username, email, firstname, lastname)
    @username = username
    @email = email
    @firstname = firstname
    @lastname = lastname

    @friends = Set.new
    @friend_requests = Set.new
    @posts = []

    puts "Created #{self}"
  end

  def to_s
    "#{@username}"
  end


  def fullname()
    "#{@firstname} #{@lastname}"
  end


  def send_friend_request(other)
    request = FriendRequest.new(self, other)

    other.friend_requests.add(request)
    puts "Sending friend request to #{other} ..."
  end

  def accept_friend_requests()
    requests = list_friend_requests
    
    while true
      puts "press request number e.g. '0' to accept request"
      print "or press 'a' to accept all: "
      answer = gets.chomp
      if answer == 'a'
        # accept all friend requests
        requests.each { |request|
          new_friend = request.from
          new_friend.friends.add(self)
          @friends.add(new_friend)
        }
        puts "Accepted #{requests.length} requests"
        break
      elsif answer.to_i >= 0 && answer.to_i < friend_requests.length
        # accept particular request
        new_friend = requests[answer.to_i].from
        new_friend.friends.add(self)
        @friends.add(new_friend)

        puts "Accepted friend request from #{new_friend}"
        puts "press any key to continue or 'n' to exit"
        continue = gets.chomp
        if continue.downcase == 'n'
          break
        end
      else
        puts "invalid answer!"
      end
    end
  end

  def unfriend(other)
    if @friends.include? other
      @friends.delete(other)
      other.friends.delete(self)
      puts "#{self} unfriended #{other} ..."
    else
      puts "#{self} can't unfriend #{other} because they were not friends in the first place ..."     
    end
  end

  def list_friends
    puts
    puts "Hi #{self.firstname}!"
    puts "The following people are your friends:"
    puts "---------------------------------------------------"
    @friends.each_entry { |value|
      puts " #{value}"
    }
    puts "---------------------------------------------------"
    puts
  end

  def list_friend_requests()
    requests = @friend_requests.to_a
    puts
    puts "Hi #{self.firstname}!"
    puts "The following people want to be friends with you:"
    puts "---------------------------------------------------"
    requests.each_with_index { |value, index|
      puts "#{index}: #{value}"
    }
    puts "---------------------------------------------------"
    puts
    requests
  end



  def create_post(message)
    post = Post.new(message, self, Time.now)
    @posts.push(post)
    post
  end

  def list_posts() #Users wall
    puts
    puts "Hi #{self.firstname}!"
    puts "Here are all your posts:"
    puts "---------------------------------------------------"
    @posts.each { |post|
      puts "#{post}"
      puts
    }
    puts "---------------------------------------------------"
    puts
    @posts
  end


  def view_feed()
    # objects.sort_by {|obj| obj.attribute}
    # get all posts
     # filter by posts of people you're friends with
      # sort by date (latest first)

    feed = []
    feed.concat(@posts)

    @friends.each { |friend|
      feed.concat(friend.posts)
    }

    feed = feed.sort_by {|post| post.date}

    puts
    puts "Hi #{self.firstname}!"
    puts "Here is your feed for today:"
    puts "---------------------------------------------------"
    feed.each { |post|
      puts "#{post}"
      puts
    }
    puts "---------------------------------------------------"
    puts
    feed
  end


  def create_comment(message, parent)
    comment = Comment.new(message, self, Time.now, parent)
    parent.comments.push(comment)
    comment
  end
end
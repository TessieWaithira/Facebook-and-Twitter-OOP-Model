$LOAD_PATH << '.'

require 'user'
require 'post'
require 'comment'


peter = User.new("ohara.invent", "ohara.invent@gmail.com", "Peter", "O'Hara Adu")
tess = User.new("tess.waithira", "tess.waithira@gmail.com", "Teresa", "Waithira")

peter.create_post(
	"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"\
	"tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"\
	"quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"\
	"consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse"\
	"cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non"\
	"proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
)


tess.create_post(
	"\“When one door of happiness closes, another opens; but often we look"\
	"so long at the closed door that we do not see the one which has"\
	"opened for us.\” — Helen Keller"
)

peter.create_post(
	"This is a test post"
)


post_by_tess = tess.create_post(
	"#Repost @nuncie with @repostapp"\
	"・・・"\
	"I'm reppin' for the girls who taking over the world"\
	"Help me raise a glass for the college grads"\
	"#whoruntheworldgirls"
)

comment_by_peter = peter.create_comment(
	"I miss Matthew :(",
	post_by_tess
)

tess.create_comment(
	"Awwww!",
	comment_by_peter
)


# tess.list_friends
peter.send_friend_request(tess)
tess.accept_friend_requests
# tess.list_friends

peter.view_feed
# peter.list_friends
# tess.list_friends
# tess.unfriend(peter)
# peter.list_friends
# tess.list_friends
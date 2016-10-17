
from user import User
from tweet import Tweet
from reply import Reply


peter = User("ohara.invent", "ohara.invent@gmail.com", "Peter", "O'Hara Adu")
tess = User("tess.waithira", "tess.waithira@gmail.com", "Teresa", "Waithira")

peter.create_tweet(
	"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"\
	"tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"\
	"quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"\
	"consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse"\
	"cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non"\
	"proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
)


tess.create_tweet(
	"\“When one door of happiness closes, another opens; but often we look"\
	"so long at the closed door that we do not see the one which has"\
	"opened for us.\” — Helen Keller"
)

peter.create_tweet(
	"This is a test tweet"
)


tweet_by_tess = tess.create_tweet(
	"#Retweet @nuncie with @retweetapp"\
	"・・・"\
	"I'm reppin' for the girls who taking over the world"\
	"Help me raise a glass for the college grads"\
	"#whoruntheworldgirls"
)

reply_by_peter = peter.create_reply(
	"I miss Matthew :(",
	tweet_by_tess
)

tess.create_reply(
	"Awwww!",
	reply_by_peter
)


tess.list_follows()
peter.send_follow_request(tess)
tess.accept_follow_requests()
tess.list_follows()

peter.view_feed()
peter.list_follows()
tess.list_follows()
tess.unfollow(peter)
peter.list_follows()
tess.list_follows()
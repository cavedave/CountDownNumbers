#!/usr/bin/env ruby

require 'rubygems'
require 'chatterbot/dsl'
require 'twitter'

#
# this is the script for the twitter bot cecilgame
# generated on 2013-11-07 10:07:55 +0000
#


BigNums = Array[25,50,75,100]
SmallNums = Array[1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10]

$SAFE = 1

#random generator of numbers given to user
def getNums
	return BigNums.sample(2) + SmallNums.sample(4)
end

def problemTweet(tweet,client)
	reply "#USER# your goal is #{goalNum} using #{getNums.join(" ")}.",tweet
end
# remove this to send out tweets
#debug_mode

# remove this to update the db
#no_update
# remove this to get less output when running
verbose

# here's a list of users to ignore
#blacklist "abc", "def"

# here's a list of things to exclude from searches
#exclude "hi", "spammer", "junk"

#search "keyword" do |tweet|
# reply "Hey #USER# nice to meet you!", tweet
#end
def goalNum
	return rand(100..999)
end
   
#run in a loop and send people problems                        
loop do
	#get the time now so we can ignore old tweets
	time1 = Time.new

 # checking for replies to me
	replies do |tweet|
		
		if ((time1 - tweet.created_at)<60)
			#reply "#USER# your goal is #{goalNum} using #{getNums.join(" ")}.",tweet
			problemTweet(tweet,client)
		end
	end

  # explicitly update our config
  #update_config
	#reset_since_id
  sleep 60

end



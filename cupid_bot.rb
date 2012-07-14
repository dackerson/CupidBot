require 'twitter'
require_relative 'match_maker.rb'
require_relative 'gender_finder.rb'

class CupidBot

	def initialize
		@match_maker = MatchMaker.new
		@gender_finder = GenderFinder.new
	end

	def perform
		Twitter.search("#lonely OR #single :( -rt", :lang => "en", :rpp => 100, :result_type => "recent").results.each do |tweet|
			user = Twitter.user(tweet.from_user)
			
			@match_maker.add(tweet.from_user, user.location, gender_finder.get_gender(tweet.from_user))
		end
	end

end

cupid = CupidBot.new
cupid.perform

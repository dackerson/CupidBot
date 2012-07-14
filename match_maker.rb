class MatchMaker

	def initialize
		@locations = {}
	end

	def add(name, location, gender)

		if locations.has_key?(location)
			locations[location]= [{:name=>name, :gender=>gender}]
		else
			locations[location] << {:name=>name, :gender=>gender}
		end
	end

end

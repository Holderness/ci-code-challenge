require_relative 'test_helper'

class DataAggregatorTest < Minitest::Test

	def setup
		@data = [
	    PoliticianData.new('data/politicians.txt').standardize_politician_data,
      TennisPlayerData.new('data/tennis_players.txt').standardize_tennis_player_data,
      HockeyPlayerData.new('data/hockey_players.txt').standardize_hockey_player_data
    ]
	end

  def test_aggregator
  	expected = [
  		Record.new(
        last_name:  "Abercrombie",
  		  first_name: "Neil",
  	    gender:     "Male",
  	    dob:        "2/13/1943",
  	    fav_color:  "Tan"
  		).to_s,
  		Record.new(
        last_name:  "Kournikova",
  		  first_name: "Anna",
  	    gender:     "Female",
  	    dob:        "6/3/1975",
  	    fav_color:  "Red"
  		).to_s,
  		Record.new(
        last_name:  "Smith",
  		  first_name: "Steve",
  	    gender:     "Male",
  	    dob:        "3/3/1985",
  	    fav_color:  "Red"
  		).to_s
  	]
  	actual = [
  		DataAggregator.new(@data).aggregate[0].to_s,
  		DataAggregator.new(@data).aggregate[3].to_s,
  		DataAggregator.new(@data).aggregate[6].to_s
  	]
  	assert_equal(expected, actual, "Data from #{actual} should pass through 
  		the DataAggregator and return as #{expected}")
  end

end
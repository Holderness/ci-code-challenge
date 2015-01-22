require_relative 'test_helper'
require_relative '../lib/record_parser'

class RecordTest < Minitest::Test

	def setup
    @politic = PoliticianData.new('data/politicians.txt')
    @tennis = TennisPlayerData.new('data/tennis_players.txt')
    @hockey = HockeyPlayerData.new('data/hockey_players.txt')
	end

	def test_politician_parse
    expected = [
      "Bishop",
      "Timothy",
      "Male",
      "Yellow",
      "4/23/1967"
    ]
    actual = @politic.parse_data_into_array[1]
    assert_equal(expected, actual, "@politic.parse_data_into_array[1] should 
    	return the array #{expected}")
	end

	def test_tennis_parse
    expected = [
      "Hingis",
      "Martina",
      "M",
      "F",
      "4-2-1979",
      "Green"
    ]
    actual = @tennis.parse_data_into_array[1]
    assert_equal(expected, actual, "@tennis.parse_data_into_array[1] should 
    	return the array #{expected}")
	end

	def test_hockey_parse
    expected = [
      "Bonk",
      "Radek",
      "S",
      "M",
      "Green",
      "6-3-1975"
    ]
    actual = @hockey.parse_data_into_array[1]
    assert_equal(expected, actual, "@hockey.parse_data_into_array[1] should 
    	return the array #{expected}")
	end

	def test_politician_array_standardization
		expected = [
      "Bishop",
      "Timothy",
      "Male",
      "4/23/1967",
      "Yellow"
    ]
		actual = @politic.standardize_politician_array[1]
		assert_equal(expected, actual, "@politic.standardize_politician_array[1] 
			should return teh array #{expected}")
	end

	def test_tennis_array_standardization
		expected = [
      "Hingis",
      "Martina",
      "F",
      "4-2-1979",
      "Green"
    ]
		actual = @tennis.standardize_tennis_player_array[1]
		assert_equal(expected, actual, "@tennis.standardize_politician_array[1] 
			should return teh array #{expected}")
	end

	def test_hockey_array_standardization
		expected = [
      "Bonk",
      "Radek",
      "M",
      "6-3-1975",
      "Green"
    ]
		actual = @hockey.standardize_hockey_player_array[1]
		assert_equal(expected, actual, "@hockey.standardize_politician_array[1] 
			should return teh array #{expected}")
	end

end
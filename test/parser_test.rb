require_relative 'test_helper'
require_relative '../lib/record_parser'

class RecordTest < Minitest::Test

	def setup
    @politic = ParseData.new('../data/politicians.txt')
    @tennis = ParseData.new('../data/tennis_players.txt')
    @hockey = ParseData.new('../data/hockey_players.txt')
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
    assert_equal(expected, actual, "The second element in both arrays should match")
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
    assert_equal(expected, actual, "The second element in both arrays should match")
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
    assert_equal(expected, actual, "The second element in both arrays should match")
	end

end
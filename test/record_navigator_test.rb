require_relative 'test_helper'

include RecordHelper

class RecordNavigatorTest < Minitest::Test

	def setup
    data = [
	    PoliticianData.new('data/politicians.txt').standardize_politician_data,
      TennisPlayerData.new('data/tennis_players.txt').standardize_tennis_player_data,
      HockeyPlayerData.new('data/hockey_players.txt').standardize_hockey_player_data
    ]
    records = DataAggregator.new(data).aggregate
    @record_navigator = RecordNavigator.new(records)
	end

	def test_adjust_by_gender_and_last_name_asc
    expected = "Hingis Martina Female 4/2/1979 Green"
    actual = @record_navigator.by_gender_and_last_name[0].to_s
    assert_equal(expected, actual, "#{actual} should match the top result as 
    	#{expected}") 
	end

	def test_adjust_by_dob_asc
    expected = "Abercrombie Neil Male 2/13/1943 Tan"
    actual = @record_navigator.by_dob[0].to_s
    assert_equal(expected, actual, "#{actual} should match the top result as 
    	#{expected}")
	end

	def test_adjust_by_last_name_desc
    expected = "Smith Steve Male 3/3/1985 Red"
    actual = @record_navigator.by_last_name_desc[0].to_s
    assert_equal(expected, actual, "#{actual} should match the top result as 
    	#{expected}")
	end

end
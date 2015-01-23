
require_relative 'lib/record'
require_relative 'lib/data_parser'
require_relative 'lib/data_aggregator'
require_relative 'lib/record_navigator'
require_relative 'lib/record_helper'

include RecordHelper

data = [
	PoliticianData.new('data/politicians.txt').standardize_politician_data,
  TennisPlayerData.new('data/tennis_players.txt').standardize_tennis_player_data,
  HockeyPlayerData.new('data/hockey_players.txt').standardize_hockey_player_data
]

records = DataAggregator.new(data).aggregate
record_navigator = RecordNavigator.new(records)

output = File.open("./output.txt", 'w')

write_record(output, "Output 1:", record_navigator.by_gender_and_last_name)
write_record(output, "Output 2:", record_navigator.by_dob)
write_record(output, "Output 3:", record_navigator.by_last_name_desc)


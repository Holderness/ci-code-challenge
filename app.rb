
Dir["lib/*.rb"].each {|file| require file }

include RecordHelper

data = [
	PoliticianData.new('data/politicians.txt').standardize_politician_data,
  TennisPlayerData.new('data/tennis_players.txt').standardize_tennis_player_data,
  HockeyPlayerData.new('data/hockey_players.txt').standardize_hockey_player_data
]

records = DataAggregator.new(data).aggregate
record_navigator = RecordNavigator.new(records)

write(record_navigator.by_gender_and_last_name)
write(record_navigator.by_dob)



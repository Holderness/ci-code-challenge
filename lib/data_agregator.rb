

class DataAgregator
	attr_reader :data

  def initialize
		@data = [
		  PoliticianData.new('data/politicians.txt').standardize_politician_array,
      TennisPlayerData.new('data/tennis_players.txt').standardize_tennis_player_array,
      HockeyPlayerData.new('data/hockey_players.txt').standardize_hockey_player_array
    ]
  end

  def attributes
  	{ 
  		last_name:  self[0],
  		first_name: self[1],
  	  gender:     self[2],
  	  dob:        self[3],
  	  fav_color:  self[4]
  	}
  end

  def agregate
  	record_array = @data.map do |profession|
  		profession.map do |person|
  			Record.new(person.attributes)
  		end
  	end
  	record_array.flatten
  end
end
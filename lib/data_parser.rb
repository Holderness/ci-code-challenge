
require 'csv'


class DataParser
  attr_reader :raw_data, :data_array

  def initialize(file_path)
    @raw_data = File.readlines(file_path)
    @data_array = self.parse_data_into_array
  end

  def parse_data_into_array
    csv_data = @raw_data.map{ |line| line.strip.gsub(/\,?\s\|?\s?/, ",") }
    csv_data.map{ |line| CSV.parse(line).flatten }
  end

  def remove_middle_init(data_array)
  	data_array.map{ |elem| elem.delete_at(2) }
  	data_array
  end

  def swap_date_and_color(data_array)
  	data_array.map do |elem| 
      elem[3], elem[4] = elem[4], elem[3]
    end
    data_array
  end
end



class TennisPlayerData < DataParser
  def standardize_tennis_player_data
  	remove_middle_init(@data_array)
  end
end


class PoliticianData < DataParser
  def standardize_politician_data
  	swap_date_and_color(@data_array)
  end
end


class HockeyPlayerData < DataParser
  def standardize_hockey_player_data
  	filtered_data = remove_middle_init(@data_array)
    swap_date_and_color(filtered_data)
  end
end
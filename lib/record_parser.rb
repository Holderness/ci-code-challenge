
require 'csv'


class ParseData
  attr_reader :raw_data, :data_array

  def initialize(file_path)
    @raw_data = File.readlines(file_path)
    @data_array = self.parse_data_into_array
  end

  def parse_data_into_array
    csv_data = @raw_data.map{ |line| line.strip.gsub(/\,?\s\|?\s?/, ",") }
    csv_data.map{ |line| CSV.parse(line).flatten }
  end

  def remove_middle_init(record_array)
  	record_array.map{ |elem| elem.delete_at(2) }
  	record_array
  end

  def swap_date_and_color(record_array)
  	record_array.map do |elem| 
      elem[3], elem[4] = elem[4], elem[3]
    end
    record_array
  end
end


class TennisPlayerData < ParseData
  def standardize_tennis_player_array
  	remove_middle_init(@data_array)
  end
end


class PoliticianData < ParseData
  def standardize_politician_array
  	swap_date_and_color(@data_array)
  end
end


class HockeyPlayerData < ParseData
  def standardize_hockey_player_array
  	filtered_data = remove_middle_init(@data_array)
    swap_date_and_color(filtered_data)
  end
end

require 'csv'


class ParseData

  attr_reader :raw_data

  def initialize(file_path)
    @raw_data = File.readlines(file_path)
  end

  def parse_data_into_array(raw_data)
    csv_data = raw_data.map{ |line| line.gsub(/\n+/, "").gsub(/\s|\||\,/, ",") }
    @parsed_csv_array = csv_data.map{|row| CSV.parse(row).flatten}
  end

  def 

end


class TennisPlayerData < ParseData


end


class PoliticianData < ParseData

end


class HockeyPlayerData < ParseData

end
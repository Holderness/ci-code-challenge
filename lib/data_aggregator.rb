

class DataAggregator
	attr_reader :data

  def initialize(data)
		@data = data
  end

  def attributes(array)
  	{
  		last_name:  array[0],
  		first_name: array[1],
  	  gender:     array[2],
  	  dob:        array[3],
  	  fav_color:  array[4]
  	}
  end

  def aggregate
  	record_array = @data.map do |profession|
  		profession.map do |person|
  			Record.new(attributes(person))
  		end
  	end
  	record_array.flatten
  end
end
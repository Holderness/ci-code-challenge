
module RecordHelper

  def write_record(file, header, record_nav)
  	file.write(header + "\n")
  	record_nav.each do |record| 
  		file.write(record.to_s + "\n")
  	end
  	file.write("\n")
  end
end
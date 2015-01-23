module RecordHelper

  def write(records)
  	records.each{ |record| puts record.to_s }
  end

end
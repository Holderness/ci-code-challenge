require 'date'

class RecordNavigator

	attr_reader :records, :by_gender_and_last_name, :by_dob, :by_last_name_desc

	def initialize(records)
		@records = records
		@by_gender_and_last_name = adjust_by_gender_and_last_name_asc
		@by_dob = adjust_by_dob_asc
		@by_last_name_desc = adjust_by_last_name_desc
	end

  def adjust_by_gender_and_last_name_asc
    records.sort_by{ |record| [record.gender, record.last_name].to_s }
  end

	def adjust_by_dob_asc
    records.sort_by{ |record| Date.strptime(record.dob, "%m/%d/%Y") }
	end

  def adjust_by_last_name_desc
    records.sort_by{ |record| record.last_name }.reverse
  end

end
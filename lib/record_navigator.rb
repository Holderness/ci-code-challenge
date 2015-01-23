require 'date'

class RecordNavigator

	attr_reader :records

	def initialize(records)
		@records = records
	end

	def adjust_by_dob_asc
    @records.sort_by{ |record| Date.strptime(record.dob, "%m/%d/%Y") }
	end

  def adjust_by_gender_and_last_name_asc
    @records.sort_by{ |record| [record.gender, record.last_name] }
  end

  def adjust_by_last_name_desc
    @records.sort_by{ |record| record.last_name }.reverse
  end

end
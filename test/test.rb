require_relative 'test_helper'
require_relative '../lib/record'
require_relative '../lib/record_helper'
require_relative '../lib/record_parser'

class RecordTest < Minitest::Test

	def setup
		@record = Record.new
	end


end
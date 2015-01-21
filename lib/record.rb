class Record

	attr_reader :first_name, :last_name, :middle_init, :gender, :dob, :fav_color

	def initialize( options = {} )
		@first_name = options[:first_name]
		@last_name = options[:last_name]
		@middle_init = options[:middle_init]
		@gender = options[:gender]
		@dob = options[:dob]
		@fav_color = options[:fav_color]
	end

end
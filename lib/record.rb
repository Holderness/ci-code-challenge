class Record

  attr_reader :first_name, :last_name, :middle_init, :gender, :dob, :fav_color

  def initialize( options = {} )
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @middle_init = options[:middle_init]
    @gender = tweak_gender(options[:gender])
    @dob = tweak_date(options[:dob])
    @fav_color = options[:fav_color]
  end

  def tweak_date(date)
  	date.gsub("-", "/")
  end

  def tweak_gender(gender)
  	if gender == "M"
  		"Male"
  	elsif gender == "F"
  		"Female"
  	else
  		gender
  	end
  end

end
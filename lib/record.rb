class Record

  attr_reader :last_name, :first_name, :gender, :dob, :fav_color

  def initialize( options = {} )
  	@last_name = options[:last_name]
    @first_name = options[:first_name]
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
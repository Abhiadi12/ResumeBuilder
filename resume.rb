class Resume
	#require "csv" load in runner method
	include Validator
	attr_accessor:first_name,:last_name,:age,:gender
	
	def self.build 
		object = self.new
		loop do
			puts " Do You Want To Create A Resume[Y-N]"
			response = gets.chomp.downcase
			break if response == "n"
			object.first_name = object.looping_entry("first_name")
			object.last_name = object.looping_entry("last_name")
			object.age = object.looping_entry("age")
			object.gender = object.looping_entry("gender")
			object.load_to_csv
			end
	end

	def load_to_csv
		
				CSV.open("resume.csv", "a+") do |csv|
				csv << [first_name,last_name,gender,age]
				puts "Data Inserted successfully"
				
				end
	end

	def looping_entry(entry_message)
		@entry
		loop do
			puts " Enter your #{entry_message}"
			@entry = gets.chomp
			if entry_message == "first_name" || entry_message == "last_name"
				break if self.is_correct_name?(@entry)
			elsif entry_message == "age"
				break if self.is_correct_age?(@entry.to_i)
			else
				break if self.is_correct_gender?(@entry)
			end
			puts "Wrong Data Entry:::Try Again"
		end
		return @entry
	end

end

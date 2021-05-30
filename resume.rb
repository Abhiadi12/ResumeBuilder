class Resume
	#require "csv" load in runner method
	include Validator
	attr_accessor:first_name,:last_name,:age,:gender,:limit
	
	def self.build 
		object = self.new
		object.limit = 0;
		loop do
			puts " Do You Want To Create A Resume[Y-N]"
			response = gets.chomp.downcase
			break if response != "y"
			object.first_name = object.looping_entry("first_name")
			if object.limit_reach
				puts "limit reach"
				break
			end
			object.last_name = object.looping_entry("last_name")
			if object.limit_reach
				puts "limit reach"
				break
			end


			object.age = object.looping_entry("age")
			if object.limit_reach
				puts "limit reach"
				break
			end


			object.gender = object.looping_entry("gender")
			if object.limit_reach
				puts "limit reach"
				break
			end


			object.load_to_csv
		end
	end

	def limit_reach
		self.limit > 3
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
			break if self.limit > 2
			puts " Enter your #{entry_message}"
			@entry = gets.chomp
			if entry_message == "first_name" || entry_message == "last_name"
				break if self.is_correct_name?(@entry)
			elsif entry_message == "age"
				break if self.is_correct_age?(@entry)
			else
				break if self.is_correct_gender?(@entry)
			end
			puts "Wrong Data Entry:::Try Again"
			
			self.limit = self.limit + 1

		end
		return @entry
	end
end

=begin
operations.each do |input,validate|
          begin 
              user.send(input)
              user.send(validate)
          rescue => e
            puts e
            retry
          else
            next
          end
      end
=end

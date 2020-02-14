
	module Validator

		def is_correct_name?(str)
			if str.match(/^[a-zA-Z]{3,16}+$/)==nil
				return false
			else
				return true
			end
		end

		def is_correct_age?(age)
			if age>=18
				return true
			else
				return false
			end
		end

		def is_correct_gender?(gender)
			if gender.upcase=="MALE" || gender.upcase=="FEMALE"
				return true
			else
				return false
			end
		end

	end

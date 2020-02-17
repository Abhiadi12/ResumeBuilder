module Validator
		NAME_REGEX=/^[a-zA-Z]{3,16}+$/
		AGE_REGEX=/^(([1-9]){1}([0-9]){1})$/
		def is_correct_name?(str)
			!(str.match(NAME_REGEX).nil?)
		end

		def is_correct_age?(age)
			!(age.match(AGE_REGEX).nil?) && age.to_i >=18
		end

		def is_correct_gender?(gender)
			gender.upcase=="MALE" || gender.upcase=="FEMALE" 
		end
end

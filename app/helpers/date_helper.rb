module DateHelper
	def convert_date_to_appropriate_format(data)
	
		if data
			data = Time.at data.to_i
		else
			data = Time.at 0
		end
		
		data
	end			
end

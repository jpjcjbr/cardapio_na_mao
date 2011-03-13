module ItensHelper
	def get_all_itens_from_user(user)
	
		itens = Array.new
	
		if user.categorias != nil		
			user.categorias.each do |categoria| 
				itens = itens + categoria.itens
			end		
		end
		
		itens		
	end
end

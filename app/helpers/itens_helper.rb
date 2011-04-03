module ItensHelper
	def get_all_itens_from_user(user)
	
		get_itens_from_user_by_date user, Time.at(0)
	end
	
	def get_itens_from_user_by_date(user, date)
	
		itens = Array.new
	
		if user.categorias		
			user.categorias.each do |categoria|					
				if categoria.itens		
					categoria.itens.each do |item|
						if item.updated_at > date
							itens << item
						end
					end				
				end
			end		
		end
		
		itens.sort! { |a, b| a.nome.downcase <=> b.nome.downcase }		
	end
	
	def self.tamanho_maximo_upload
		500.kilobytes
	end
end

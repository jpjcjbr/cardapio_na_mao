module CategoriasHelper
	def get_all_categorias_from_user(user)
		categorias = Categoria.find_all_by_user_id user.id

		if categorias == nil
			categorias = Array.new
		end	
		
		categorias
	end
		
end

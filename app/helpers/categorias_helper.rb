module CategoriasHelper
	def get_all_categorias_from_current_user
		categorias = Categoria.find_all_by_user_id current_user.id

		if categorias == nil
			categorias = Array.new
		end	
		
		categorias
	end
end

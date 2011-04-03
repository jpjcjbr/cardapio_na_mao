module CategoriasHelper
	def get_all_categorias_from_user(user)
		get_categorias_from_user_by_date user, Time.at(0)
	end
	
	def get_categorias_from_user_by_date(user, date)
		categorias = Categoria.order('nome ASC').where('updated_at > ?', date).find_all_by_user_id user.id

		if categorias == nil
			categorias = Array.new
		end	
		
		categorias
	end
		
end

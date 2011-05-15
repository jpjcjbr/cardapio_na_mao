module CategoriasHelper
  def get_all_categorias_from_user(user)
    get_categorias_from_user_by_date user, Time.at(0)
  end

  def get_categorias_from_user_by_date(user, date)

    return Array.new if not user

    categorias = Categoria.order('nome ASC').where('updated_at > ?', date).find_all_by_user_id user.id

    return Array.new if not categorias

    categorias
  end

end

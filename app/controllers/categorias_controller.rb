# coding: utf-8
class CategoriasController < ApplicationController
  before_filter :authenticate_user!, :except => [:all_categorias_from_user]
  before_filter :remove_json_root!, :only => [:index, :all_categorias_from_user, :show]

  respond_to :html, :xml, :json
  
  def index
    @categorias = get_all_categorias_from_user(current_user).paginate :page => params['page'], :per_page => 10

    respond_with @categorias
  end

  def all_categorias_from_user
    user = User.find_by_email params[:email]

    data = convert_date_to_appropriate_format params[:data]

    if user
      @categorias = get_categorias_from_user_by_date user, data
      respond_with @categorias
    else
      respond_with '{"erro":"Usuário Inválido."}'
    end
  end

  def show
    @categoria = Categoria.find(params[:id])
    respond_with @categoria
  end

  def new
    @categoria = Categoria.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @categoria = Categoria.find(params[:id])
  end

  def create
    @categoria = Categoria.new(params[:categoria])
    @categoria.user = current_user

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to(categorias_url, :notice => 'Categoria cadastrada com sucesso.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      if @categoria.update_attributes(params[:categoria])
        format.html { redirect_to(categorias_url, :notice => 'Categoria alterada com sucesso.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      if @categoria.itens.empty?
        @categoria.destroy
        format.html { redirect_to(categorias_url, :notice => 'Categoria exclu�da com sucesso.') }
      else
        format.html { redirect_to(categorias_url, :alert => 'N�o foi poss�vel excluir a categoria "' + @categoria.nome + '", ela possui itens associados.') }
      end
    end
  end
end

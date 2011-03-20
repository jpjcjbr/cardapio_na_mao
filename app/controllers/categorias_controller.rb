class CategoriasController < ApplicationController
	before_filter :authenticate_user!, :except => [:all_categorias_from_user]	
	
	respond_to :html, :xml, :json
	
  # GET /categorias
  # GET /categorias.xml
  def index
	ActiveRecord::Base.include_root_in_json = false
	
    @categorias = get_all_categorias_from_user(current_user).paginate :page => params['page'], :per_page => 10
	
    respond_with @categorias
  end

  def all_categorias_from_user
	ActiveRecord::Base.include_root_in_json = false			
	
	user = User.find_by_email params[:email]
	
	data = convert_date_to_appropriate_format params[:data]
	
	if user
		@categorias = get_categorias_from_user_by_date user, data
		respond_with @categorias
	else
		respond_with '{"erro":"Usuário Inválido."}'
	end	
  end

  # GET /categorias/1
  # GET /categorias/1.xml
  def show
	ActiveRecord::Base.include_root_in_json = false
    @categoria = Categoria.find(params[:id])	

    respond_with @categoria
  end

  # GET /categorias/new
  # GET /categorias/new.xml
  def new
    @categoria = Categoria.new
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @categoria }
    end
  end

  # GET /categorias/1/edit
  def edit
    @categoria = Categoria.find(params[:id])
  end

  # POST /categorias
  # POST /categorias.xml
  def create
    @categoria = Categoria.new(params[:categoria])
	@categoria.user = current_user

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to(@categoria, :notice => 'Categoria was successfully created.') }
        format.xml  { render :xml => @categoria, :status => :created, :location => @categoria }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @categoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categorias/1
  # PUT /categorias/1.xml
  def update
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      if @categoria.update_attributes(params[:categoria])
        format.html { redirect_to(@categoria, :notice => 'Categoria was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @categoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categorias/1
  # DELETE /categorias/1.xml
  def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.destroy

    respond_to do |format|
      format.html { redirect_to(categorias_url) }
      format.xml  { head :ok }
    end
  end  
end

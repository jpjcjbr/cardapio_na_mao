class ItensController < ApplicationController
	before_filter :remover_currency, :only => [:create, :update]	
	before_filter :authenticate_user!, :except => [:all_itens_from_user]
	respond_to :html, :xml, :json			
	
  # GET /itens
  # GET /itens.xml
  def index
	ActiveRecord::Base.include_root_in_json = false    
	
	@itens = get_all_itens_from_user(current_user).paginate :page => params['page'], :per_page => 10
		
	respond_with @itens
  end
  
  def all_itens_from_user
	ActiveRecord::Base.include_root_in_json = false			
	
	user = User.find_by_email params[:email]
	
	data = convert_date_to_appropriate_format params[:data]
		
	if user	
		@itens = get_itens_from_user_by_date user, data
		respond_with @itens		
	else
		respond_with '{"erro":"Usuário Inválido."}'
	end	
  end

  # GET /itens/1
  # GET /itens/1.xml
  def show
	ActiveRecord::Base.include_root_in_json = false
    @item = Item.find(params[:id])	
    respond_with @item
  end

  # GET /itens/new
  # GET /itens/new.xml
  def new
    @item = Item.new
	@operation = 'create'	
    respond_to do |format|
      format.html
    end
  end

  # GET /itens/1/edit
  def edit
    @item = Item.find(params[:id])
	
	@operation = 'update'	
  end

  # POST /itens
  # POST /itens.xml
  def create	
    @item = Item.new(params[:item])
		
    respond_to do |format|
      if @item.save
        format.html { redirect_to(itens_url, :notice => 'Item cadastrado com sucesso.') }        
      else
        format.html { render :action => "new" }        
      end
    end
  end

  # PUT /itens/1
  # PUT /itens/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(itens_url, :notice => 'Item atualizado com sucesso.') }        
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /itens/1
  # DELETE /itens/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(itens_url, :notice => 'Item excluído com sucesso.') }
      format.xml  { head :ok }
    end
  end
  
  protected
  def remover_currency	
	params[:item][:preco] = params[:item][:preco].to_s.gsub(/[^0-9,]/,'').gsub(/,/,'.').to_f	
  end   
end

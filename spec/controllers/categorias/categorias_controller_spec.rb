require 'spec_helper'

describe CategoriasController do
  
  before do
    @user_logado = Factory(:user)
    sign_in @user_logado
  end
  
  describe "ao salvar uma categoria" do
    
    def criar_categoria
      post :create, :categoria => Factory.attributes_for(:categoria)
    end
    
    it "deve carregar a tela de nova categoria" do
      get :new
      response.should render_template(:action => "new")
    end
    
    it "deve associar um usuario a categoria criada" do 
      expect {
        criar_categoria
      }.to change(Categoria, :count).by(1)
    end
    
    it "deve redirecionar o usuario para a tela de listagem" do
      criar_categoria
      response.should redirect_to(categorias_url)
    end
    
    it "deve redirecionar para a tela de criacao quando ocorrer um erro durante a criacao" do
      post :create, :categoria => Categoria.new
      response.should render_template(:action => "new")
    end
  end
  
  describe "ao atualizar uma categoria" do
    
    it "deve carregar uma categoria para a edicao" do
      categoria = Factory(:categoria)
      get :edit, :id => categoria.id
      response.should render_template(:action => 'edit')
    end
    
    it "deve redirecionar o usuario para a tela de listagem" do
      categoria = Factory(:categoria)
      put :update, :id => categoria.id, :categoria => {'nome' => 'nome_alterado'}
      response.should redirect_to(categorias_url)
    end
    
    it "deve redirecionar para a tela de edicao quando ocorrer erro durante a edicao" do
      categoria = Factory(:categoria)
      put :update, :id => categoria.id, :categoria => {'nome' => ''}
      response.should render_template(:action => "edit")
    end
  end
  
  describe "ao listar as categorias" do
    it "deve exibir todas as categorias cadastradas ordenadas por nome" do
      categoria3 = Factory(:categoria, :nome => "categoria3", :user => @user_logado)
      categoria1 = Factory(:categoria, :nome => "categoria1", :user => @user_logado)
      categoria2 = Factory(:categoria, :nome => "categoria2", :user => @user_logado)
      
      get :index
      
      assigns(:categorias).should eq([categoria1, categoria2, categoria3])
    end
  end
  
  describe "ao deletar uma categoria" do    
    it "deve redirecionar o usuario para a tela listagem" do
      categoria = Factory(:categoria)
      delete :destroy, :id => categoria.id.to_s      
      response.should redirect_to(categorias_url)
    end
    
    it "deve deletar a categoria quando nao existirem itens associados" do
      categoria = Factory(:categoria)
      
      expect {
        delete :destroy, :id => categoria.id.to_s
      }.to change(Categoria, :count).by(-1)
    end
    
    it "nao deve deletar a categoria quando existirem itens associados" do
      item = Factory(:item)
      categoria = item.categoria
      
      expect {
        delete :destroy, :id => categoria.id.to_s
      }.to change(Categoria, :count).by(0)
    end
  end
  
  describe "ao buscar as categorias de um usuario" do
    #it "deve retornar todas as categorias de um usuario valido" do
    #  user = Factory(:user)
    #  get :all_categorias_from_user, :email => user.email
    #  response.should be_success
    #end
    
    #it "deve retornar um erro quando o usuario for invalido" do
    #  get :all_categorias_from_user, :email => "email nao existente"
    #  response.should_not be_success
    #end
  end
end

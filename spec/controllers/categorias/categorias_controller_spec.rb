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
    
    it "deve associar um usuario a categoria criada" do 
      expect {
        criar_categoria
      }.to change(Categoria, :count).by(1)
    end
    
    it "deve redirecionar o usuario para a tela de listagem" do
      criar_categoria
      response.should redirect_to(categorias_url)
    end
  end
  
  describe "ao atualizar uma categoria" do
    it "deve redirecionar o usuario para a tela de listagem" do
      categoria = Factory(:categoria)
      put :update, :id => categoria.id, :categoria => {'nome' => 'nome_alterado'}
      response.should redirect_to(categorias_url)
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
  end
end

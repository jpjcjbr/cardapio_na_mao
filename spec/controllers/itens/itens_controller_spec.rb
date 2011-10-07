require 'spec_helper'

describe ItensController do
  
  before do
    @user_logado = Factory(:user)
    sign_in @user_logado
  end
  
  describe "ao salvar um item" do
    
    def criar_item
      categoria = Factory(:categoria)
      post :create, :item => Factory.attributes_for(:item, :categoria => categoria)
    end
    
    it "deve carregar a tela de novo item" do
      get :new
      response.should render_template(:action => "new")
    end
        
    it "deve redirecionar o usuario para a tela de listagem" do
      criar_item
      response.should redirect_to(itens_url)
    end
    
    it "deve redirecionar para a tela de criacao quando ocorrer um erro durante a criacao" do
      post :create, :item => Item.new
      response.should render_template(:action => "new")
    end
  end
  
  describe "ao atualizar um item" do
    
    it "deve carregar um item para a edicao" do
      item = Factory(:item)
      get :edit, :id => item.id
      response.should render_template(:action => 'edit')
    end
    
    it "deve redirecionar o usuario para a tela de listagem" do
      item = Factory(:item)
      put :update, :id => item.id, :item => {'nome' => 'nome_alterado', 'preco' => 20}
      response.should redirect_to(itens_url)
    end
    
    it "deve redirecionar para a tela de edicao quando ocorrer erro durante a edicao" do
      item = Factory(:item)
      put :update, :id => item.id, :item => {'nome' => ''}
      response.should render_template(:action => "edit")
    end
  end
  
  describe "ao listar os itens" do
    it "deve exibir todas os itens cadastrados ordenadas por nome" do
      user = @user_logado

      cat1 = Categoria.new(:nome => 'aaaaa')
      cat2 = Categoria.new(:nome => 'bbbbb')

      user.categorias = [cat2, cat1]

      item1 = Item.new(:nome => 'zzz', :preco => 10)
      item2 = Item.new(:nome => 'xxx', :preco => 20)
      item3 = Item.new(:nome => 'ccc', :preco => 30)
      item4 = Item.new(:nome => 'vvv', :preco => 40)

      cat1.itens = [item4, item1]
      cat2.itens = [item3, item2]
      
      get :index
      
      assigns(:itens).should eq([item3, item4, item2, item1])
    end
  end
  
  describe "ao deletar um item" do    
    it "deve redirecionar o usuario para a tela listagem" do
      item = Factory(:item)
      delete :destroy, :id => item.id.to_s      
      response.should redirect_to(itens_url)
    end
    
    it "deve deletar o item" do
      item = Factory(:item)
      
      expect {
        delete :destroy, :id => item.id.to_s
      }.to change(Item, :count).by(-1)
    end
  end      
end

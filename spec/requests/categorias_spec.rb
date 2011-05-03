require 'spec_helper'

describe "Nas views de categoria" do
  describe 'a pagina de listagem' do
    before do
      for i in 1..10
        Factory(:categoria, :nome => 'Categoria' + i.to_s)
      end
      
      get '/categorias'  
    end
    
    it "deve possuir o titulo correto" do
      response.should have_selector('h1', :content => 'Categorias2')
    end
    
    it "deve possuir um link para criar novas categorias" do
      response.should have_selector("a[href$='/categorias/new']", :content => 'Nova', :class => 'button white')
    end
    
    it "deve possuir um th para o Nome" do
      response.should have_selector("th", :content => 'Nome')
    end
    
  end
  
end

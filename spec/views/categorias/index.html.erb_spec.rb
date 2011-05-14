require 'spec_helper'

describe "categorias/index.html.erb" do
  
  before do
    @categorias = [Factory(:categoria)].paginate :page => params['page'], :per_page => 10    
  end
  
  it "deve possuir o titulo correto" do
    render
    rendered.should have_selector('h1', :content => 'Categorias')
  end
  
  it "deve possuir um link para criar novas categorias" do
    render
    rendered.should have_selector("a[href$='/categorias/new']", :content => 'Nova', :class => 'button white')
  end
    
  it "deve possuir um th para o Nome" do
    render
    rendered.should have_selector("th", :content => 'Nome')
  end
  
  it "deve mostrar que nenhuma categoria foi encontrada" do
    @categorias = Array.new.paginate :page => params['page'], :per_page => 10
    render
    rendered.should have_selector("div.wrapper_tabela p", :content => 'Nenhuma categoria cadastrada.')
  end  
end

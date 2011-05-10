require 'spec_helper'

describe "categorias/new.html.erb" do
  
  before do
    @categoria = Categoria.new  
  end
  
  it "deve possuir o titulo correto" do
    render
    rendered.should have_selector('h1', :content => 'Categoria')
  end
  
  it "deve possuir um campo para o nome da categoria" do
    render
    rendered.should have_selector("input[name='categoria[nome]']", :class => 'input')
  end
    
  it "deve possuir um link para voltar" do
    render
    rendered.should have_selector("a[href$='/categorias']", :content => 'Voltar', :class => 'button white')
  end
  
  it "deve possuir um link para salvar" do
    render
    rendered.should have_selector("a", :content => 'Salvar', :class => 'button white')
  end
end

# coding: utf-8
require 'spec_helper'

describe "itens/index.html.erb" do
  
  before do
    @itens = [Factory(:item)].paginate :page => params['page'], :per_page => 10    
  end
  
  it "deve possuir o titulo correto" do
    render
    rendered.should have_selector('h1', :content => 'Itens')
  end
  
  it "deve possuir um link para criar novos itens" do
    render
    rendered.should have_selector("a[href$='/itens/new']", :content => 'Novo', :class => 'button white')
  end
    
  it "deve possuir um th para o Nome" do
    render
    rendered.should have_selector("th", :content => 'Nome')
  end
  
  it "deve possuir um th para a Categoria" do
    render
    rendered.should have_selector("th", :content => 'Categoria')
  end
  
  it "deve possuir um th para a Descrição" do
    render
    rendered.should have_selector("th", :content => 'Descrição')
  end
  
  it "deve possuir um th para a Preço" do
    render
    rendered.should have_selector("th", :content => 'Preço')
  end
  
  it "deve mostrar que nenhum item foi encontrado" do
    @itens = Array.new.paginate :page => params['page'], :per_page => 10
    render
    rendered.should have_selector("div.wrapper_tabela p", :content => 'Nenhum item cadastrado.')
  end
  
end

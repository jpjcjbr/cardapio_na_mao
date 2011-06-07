# coding: utf-8
require 'spec_helper'

describe "itens/new.html.erb" do
  
  before do
    @item = Item.new
    @operation = 'create'
    @categorias = [Factory(:categoria)]
  end
  
  it "deve possuir o titulo correto" do
    render
    rendered.should have_selector('h1', :content => 'Item')
  end
  
  it "deve possuir um campo para o nome do item" do
    render
    rendered.should have_selector("input[name='item[nome]']", :class => 'input')
  end
  
  it "deve possuir um campo para categoria" do
    render
    rendered.should have_selector("select[name='item[categoria_id]']", :content => 'Selecione', :class => 'input')
  end
  
  it "deve possuir um campo para a Descrição" do
    render
    rendered.should have_selector("input[name='item[descricao]']", :class => 'input')
  end
  
  it "deve possuir um campo para o Preço" do
    render
    rendered.should have_selector("input[name='item[preco]']", :class => 'input')
  end
  
  it "deve possuir um campo para a imagem" do
    render
    rendered.should have_selector("input[name='item[imagem]']", :class => 'input', :type => 'file')
  end
  
  it "deve possuir um link para voltar" do
    render
    rendered.should have_selector("a[href$='/itens']", :content => 'Voltar', :class => 'button white')
  end
  
  it "deve possuir um link para salvar" do
    render
    rendered.should have_selector("a", :content => 'Salvar', :class => 'button white')
  end
end

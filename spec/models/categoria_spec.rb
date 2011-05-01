require 'spec_helper'

describe Categoria do
  
  it "deve pertencer a um usuario" do
    Categoria.new.should respond_to(:user)
  end
  
  it "deve ter muitos itens" do
    Categoria.new.should respond_to(:itens)
  end
  
  it "deve criar uma nova instancia" do    
    user = Factory(:user)
    
    lambda{
      Categoria.create :nome => 'NovaCategoria', :user_id => user.id
    }.should change(Categoria, :count).by 1    
  end
  
  [:nome, :user_id].each do |attr|
    it "deve possuir um #{attr}" do
      categoria = Categoria.new
      categoria.should_not be_valid
      categoria.errors[attr].should_not be_nil
    end
  end    
        
  it "pode gerar uma categoria usando a factory" do
    categoria = Factory :categoria
    categoria.should_not be_nil
    categoria.should be_kind_of(Categoria)
  end
  
  it "deve possuir um nome unico no escopo de usuario" do
    categoria1 = Factory(:categoria, :nome => 'Categoria1')
    
    categoria_invalida = Categoria.new(:nome => 'categoria1')
    categoria_invalida.user = categoria1.user
    
    lambda{
      categoria_invalida.save      
    }.should_not change(Categoria, :count)    
  end
  
  it "pode possuir o mesmo nome para usuarios diferentes" do

    categoria1 = Factory(:categoria, :nome => 'categoria1')
    
    nova_categoria = Categoria.new(:nome => 'categoria1')
    nova_categoria.user = Factory(:user, :email => 'jpjcjbr2@gmail.com')
    
    lambda{
      nova_categoria.save
    }.should change(Categoria, :count).by 1
  end
  
  it "nao deve salvar quando associado a um usuario inexistente" do
    categoria1 = Categoria.new(:nome => 'categoria2', :user_id => 777)
    
    lambda{
      categoria1.save
    }.should_not change(Categoria, :count)
  end
end

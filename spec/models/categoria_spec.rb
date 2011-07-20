require 'spec_helper'

describe Categoria do

  subject { Factory(:categoria) }
  
  it { should belong_to(:user) }
  it { should have_many(:itens) }
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:user) }
            
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
end

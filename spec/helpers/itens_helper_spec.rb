require 'spec_helper'

describe ItensHelper do
  it "deve retornar todos os itens de um usuario" do
    user = Factory(:user)
    
    cat1 = Categoria.new(:nome => 'aaaaa')
    cat2 = Categoria.new(:nome => 'bbbbb')
    
    user.categorias = [cat2, cat1]
    
    item1 = Item.new(:nome => 'zzz', :preco => 10)
    item2 = Item.new(:nome => 'xxx', :preco => 20)
    item3 = Item.new(:nome => 'ccc', :preco => 30)
    item4 = Item.new(:nome => 'vvv', :preco => 40)
    
    cat1.itens = [item4, item1]
    cat2.itens = [item3, item2]
        
    resultado = helper.get_all_itens_from_user user
    
    resultado.should_not be_nil
    resultado.should_not be_empty
    resultado.length.should == 4
    resultado[0].should == item3
    resultado[1].should == item4
    resultado[2].should == item2
    resultado[3].should == item1
  end
  
  it "deve retornar um array vazio se o usuario passado for nulo" do
    resultado = helper.get_all_itens_from_user nil
    resultado.should_not be_nil
    resultado.should be_empty
  end
end

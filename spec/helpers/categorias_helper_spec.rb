require 'spec_helper'

describe CategoriasHelper do
  it "deve retornar todos as categorias de um usuario" do
    user = Factory(:user)
    
    categoria3 = Categoria.create(:nome => 'categoria3', :user_id => user.id)    
    categoria1 = Categoria.create(:nome => 'categoria', :user_id => user.id)
    categoria2 = Categoria.create(:nome => 'categoria2', :user_id => user.id)
    
    resultado = helper.get_all_categorias_from_user user
    
    resultado.should_not be_nil
    resultado.should_not be_empty
    resultado.length.should == 3
    resultado[0].should == categoria1
    resultado[1].should == categoria2
    resultado[2].should == categoria3
  end
  
  it "deve retornar um array vazio se o usuario passado for nulo" do
    resultado = helper.get_all_categorias_from_user nil
    resultado.should_not be_nil
    resultado.should be_empty
  end
end

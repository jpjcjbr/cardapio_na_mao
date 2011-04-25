require 'spec_helper'

describe CategoriasHelper do
  it "deve retornar todos as categorias de um usuario" do
    user = Factory(:user)
    
    grupo3 = Grupo.create(:nome => 'grupo3', :user_id => user.id)    
    grupo1 = Grupo.create(:nome => 'grupo', :user_id => user.id)
    grupo2 = Grupo.create(:nome => 'grupo2', :user_id => user.id)
    
    resultado = helper.get_all_grupos_from_user user
    
    resultado.should_not be_nil
    resultado.should_not be_empty
    resultado.length.should == 3
    resultado[0].should == grupo1
    resultado[1].should == grupo2
    resultado[2].should == grupo3
  end
  
  it "deve retornar um array vazio se o usuario passado for nulo" do
    resultado = helper.get_all_grupos_from_user nil
    resultado.should_not be_nil
    resultado.should be_empty
  end
end

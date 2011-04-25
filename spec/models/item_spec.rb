require 'spec_helper'

describe Item do
  
  it "deve criar uma nova instancia" do
    categoria = Factory(:categoria)
    
    lambda{
      Item.create :nome => 'NovoItem', :preco => 10.0, :categoria_id => categoria.id
    }.should change(Item, :count).by 1    
  end
  
  [:nome, :categoria_id].each do |attr|
    it "deve possuir um #{attr}" do
      item = Item.new
      item.should_not be_valid
      item.errors[attr].should_not be_nil
    end
  end    
        
  it "pode gerar um item usando a factory" do
    item = Factory :item
    item.should_not be_nil
    item.should be_kind_of(Item)
  end
  
  it "deve possuir um nome unico no escopo de categoria" do
    item1 = Factory(:item, :nome => 'Item1')
    
    item_invalido = Item.new(:nome => 'item1')
    item_invalido.categoria = item1.categoria
    
    lambda{
      item_invalido.save      
    }.should_not change(Item, :count)    
  end
  
  it "pode possuir o mesmo nome para categorias diferentes" do
    item1 = Factory(:item, :nome => 'item1')
    
    novo_item = Item.new(:nome => 'item1')
    novo_item.categoria = Factory(:categoria, :nome => 'categoriaestranha')
    
    lambda{
      novo_item.save
    }.should change(Item, :count).by 1
  end
  
  it "nao deve salvar quando associada a uma categoria inexistente" do
   item1 = Item.new(:nome => 'item2', :categoria_id => 999)
    
    lambda{
      item1.save
    }.should_not change(Item, :count) 
  end
end

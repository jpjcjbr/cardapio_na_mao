require 'spec_helper'

describe Item do
  
  subject { Factory(:item) }
  
  it { should belong_to(:categoria)}
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:categoria) }
  
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
    
    novo_item = Item.new(:nome => 'item1', :preco => 10)
    novo_item.categoria = Factory(:categoria, :nome => 'categoriaestranha')
    
    lambda{
      novo_item.save
    }.should change(Item, :count).by 1
  end
end

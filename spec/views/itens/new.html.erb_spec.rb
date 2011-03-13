require 'spec_helper'

describe "itens/new.html.erb" do
  before(:each) do
    assign(:item, stub_model(Item,
      :nome => "MyString",
      :categoria_id => 1,
      :url_imagem => "MyString",
      :descricao => "MyString",
      :preco => "9.99"
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => itens_path, :method => "post" do
      assert_select "input#item_nome", :name => "item[nome]"
      assert_select "input#item_categoria_id", :name => "item[categoria_id]"
      assert_select "input#item_url_imagem", :name => "item[url_imagem]"
      assert_select "input#item_descricao", :name => "item[descricao]"
      assert_select "input#item_preco", :name => "item[preco]"
    end
  end
end

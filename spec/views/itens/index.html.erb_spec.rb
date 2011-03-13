require 'spec_helper'

describe "itens/index.html.erb" do
  before(:each) do
    assign(:itens, [
      stub_model(Item,
        :nome => "Nome",
        :categoria_id => 1,
        :url_imagem => "Url Imagem",
        :descricao => "Descricao",
        :preco => "9.99"
      ),
      stub_model(Item,
        :nome => "Nome",
        :categoria_id => 1,
        :url_imagem => "Url Imagem",
        :descricao => "Descricao",
        :preco => "9.99"
      )
    ])
  end

  it "renders a list of itens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url Imagem".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

require 'spec_helper'

describe "itens/show.html.erb" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :nome => "Nome",
      :categoria_id => 1,
      :url_imagem => "Url Imagem",
      :descricao => "Descricao",
      :preco => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url Imagem/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Descricao/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end

require 'spec_helper'

describe "categoria/new.html.erb" do
  before(:each) do
    assign(:categoria, stub_model(Categoria,
      :nome => "MyString"
    ).as_new_record)
  end

  it "renders new categoria form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categorias_path, :method => "post" do
      assert_select "input#categoria_nome", :name => "categoria[nome]"
    end
  end
end

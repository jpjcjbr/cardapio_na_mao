require 'spec_helper'

describe "categoria/edit.html.erb" do
  before(:each) do
    @categoria = assign(:categoria, stub_model(Categoria,
      :nome => "MyString"
    ))
  end

  it "renders the edit categoria form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categoria_path(@categoria), :method => "post" do
      assert_select "input#categoria_nome", :name => "categoria[nome]"
    end
  end
end

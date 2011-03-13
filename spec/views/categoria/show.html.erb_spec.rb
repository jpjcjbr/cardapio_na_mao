require 'spec_helper'

describe "categoria/show.html.erb" do
  before(:each) do
    @categoria = assign(:categoria, stub_model(Categoria,
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
  end
end

require 'spec_helper'

describe "categoria/index.html.erb" do
  before(:each) do
    assign(:categoria, [
      stub_model(Categoria,
        :nome => "Nome"
      ),
      stub_model(Categoria,
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of categoria" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end

require "spec_helper"

describe ItensController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/itens" }.should route_to(:controller => "itens", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/itens/new" }.should route_to(:controller => "itens", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/itens/1" }.should route_to(:controller => "itens", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/itens/1/edit" }.should route_to(:controller => "itens", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/itens" }.should route_to(:controller => "itens", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/itens/1" }.should route_to(:controller => "itens", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/itens/1" }.should route_to(:controller => "itens", :action => "destroy", :id => "1")
    end

  end
end

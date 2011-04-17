require "spec_helper"

describe CategoriasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/categoria" }.should route_to(:controller => "categoria", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/categoria/new" }.should route_to(:controller => "categoria", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/categoria/1" }.should route_to(:controller => "categoria", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/categoria/1/edit" }.should route_to(:controller => "categoria", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/categoria" }.should route_to(:controller => "categoria", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/categoria/1" }.should route_to(:controller => "categoria", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/categoria/1" }.should route_to(:controller => "categoria", :action => "destroy", :id => "1")
    end

  end
end

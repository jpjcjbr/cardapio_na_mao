require 'spec_helper'

describe User do
  
  it "deve ter muitas categorias" do
    User.new.should respond_to(:categorias)
  end
  
  it "deve possuir um email" do
    User.new.should respond_to(:email)
  end
  
  it "deve possuir uma senha" do
    User.new.should respond_to(:password)
  end
  
  it "pode gerar um usuario usando a factory" do
    item = Factory :user
    item.should_not be_nil
    item.should be_kind_of(User)
  end
end
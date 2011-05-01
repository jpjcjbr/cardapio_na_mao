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
end
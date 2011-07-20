require 'spec_helper'

describe User do

  subject { Factory(:user) }
    
  it { should have_many(:categorias) }
  it { should validate_presence_of(:email) }
end
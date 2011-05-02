require 'spec_helper'

describe MoedaHelper do
  
  describe 'deve formatar valores monetarios usando o formato do brasil' do
    it "quando receber um valor monetario valido" do
      tag_gerada = helper.moeda 1234.56789
      tag_gerada.should =~ /R\$ 1234,57/
    end
  end
  
end

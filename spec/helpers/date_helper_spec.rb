require 'spec_helper'

describe DateHelper do
  
  describe 'deve converter uma data em milesegundos para um objeto Time' do
    it "quando o valor dos milisegundos for nulo" do
      resultado = helper.convert_date_to_appropriate_format nil
      
      resultado.should_not be_nil
      resultado.should == Time.at(0)  
      resultado.should be_kind_of(Time)
    end
    
    it "quando o valor dos milisegundos for 10" do
      resultado = helper.convert_date_to_appropriate_format 10
      
      resultado.should_not be_nil
      resultado.should == Time.at(10)  
      resultado.should be_kind_of(Time)
    end
  end
  
end

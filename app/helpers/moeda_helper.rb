module MoedaHelper
	def moeda(campo)
		number_to_currency campo, :precision => 2, :unit => "R$ ", :separator => ",", :delimiter => ""
	end				
end

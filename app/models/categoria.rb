class Categoria < ActiveRecord::Base
	has_many :itens	
	validates :nome, :length => { :maximum => 30 }
end

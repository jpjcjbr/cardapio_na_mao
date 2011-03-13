class Categoria < ActiveRecord::Base
	belongs_to :user
	has_many :itens	
	validates :nome, :length => { :maximum => 30 }
end

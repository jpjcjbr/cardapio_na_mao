class Categoria < ActiveRecord::Base
	belongs_to :user
	has_many :itens	
	validates :nome, :length => { :maximum => 30 }
	validates_presence_of :nome, :message => 'Nome deve ser preenchido'
	validates_uniqueness_of :nome, :message => 'Categoria j� cadastrada'	
	
	validates_presence_of :user_id
	validates_associated :user
end

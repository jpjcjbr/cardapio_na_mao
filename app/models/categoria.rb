class Categoria < ActiveRecord::Base
	belongs_to :user
	has_many :itens, :dependent => :destroy
	validates :nome, :length => { :maximum => 30 }
	validates_presence_of :nome	
	
	validates_presence_of :user
	validates_associated :user

	validates_uniqueness_of :nome, :case_sensitive => false, :scope => [:user_id]
		
end

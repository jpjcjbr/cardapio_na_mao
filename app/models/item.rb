class Item < ActiveRecord::Base
	belongs_to :categoria
	validates :nome, :length => { :maximum => 50 }
	
	has_attached_file :imagem, 
		:storage => :s3,
		:s3_credentials => Rails.root.join('config/s3.yml'),
		:path => "/:style/:filename",
		:styles => { :medium => "300x300>", :thumb => "100x100#", :original => "800x600>" }
	
	def url_imagem
		imagem.to_s
	end
end

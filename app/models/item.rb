class Item < ActiveRecord::Base	
		
	belongs_to :categoria
	validates :nome, :length => { :maximum => 50 }
	validates_presence_of :nome, :message => 'Nome deve ser preenchido'
	validates_numericality_of :preco, :greater_than => 0, :message => 'O preço deve ser maior que zero'
	
	validates_presence_of :categoria_id
	validates_associated :categoria
	
	has_attached_file :imagem, 
		:storage => :s3,
		:s3_credentials => Rails.root.join('config/s3.yml'),
		:path => "/:style/:filename",
		:styles => { :medium => "300x300>", :thumb => "100x100#", :original => "800x600>" }
		
	validates_attachment_presence :imagem	
	validates_attachment_content_type :imagem, :content_type => [ 'image/jpeg', 'image/gif', 'image/png', 'image/bmp', 'image/jpg' ]
	validates_attachment_size :imagem, :less_than => 500.kilobytes
	
	def url_imagem
		if imagem_file_name		
			imagem.to_s
		else
			''
		end
	end
			
end

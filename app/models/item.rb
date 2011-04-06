class Item < ActiveRecord::Base	
		
	belongs_to :categoria
	validates :nome, :length => { :maximum => 50 }
	validates_uniqueness_of :nome, :case_sensitive => false, :scope => [:categoria_id]
	validates_presence_of :nome, :message => 'deve ser preenchido.'
	validates_numericality_of :preco, :greater_than => 0, :message => 'deve ser maior que zero.'
	
	validates_presence_of :categoria_id, :message => 'deve ser selecionada.'
	validates_associated :categoria
	
	has_attached_file :imagem, 
		:storage => :s3,
		:s3_credentials => Rails.root.join('config/s3.yml'),
		:path => "/:style/:id",
		:styles => { :medium => "300x300>", :thumb => "100x100#", :original => "800x600>" }
			
	#validates_attachment_content_type :imagem, :content_type => [ 'image/jpeg', 'image/gif', 'image/png', 'image/bmp', 'image/jpg' ]
	validates_attachment_size :imagem, :less_than => 500.kilobytes		
	
	def url_imagem
		if imagem_file_name		
			imagem.to_s
		else
			''
		end
	end
			
end

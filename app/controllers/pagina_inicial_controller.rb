class PaginaInicialController < ApplicationController
	before_filter :authenticate_user!
	
	def index		
	end

	def ajuda		
	end
	
	def download
		send_file('public/CardapioNaMao.apk')
	end

end

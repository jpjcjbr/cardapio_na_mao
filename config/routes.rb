CardapioNaMao::Application.routes.draw do
	devise_for :users

	root :to => "pagina_inicial#index"	
end

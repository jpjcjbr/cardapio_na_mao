CardapioNaMao::Application.routes.draw do
	resources :itens

	resources :categorias

	devise_for :users

	root :to => "pagina_inicial#index"	
end

CardapioNaMao::Application.routes.draw do
	match 'categorias_json' => 'categorias#all_categorias_from_user'	
	
	resources :itens

	resources :categorias
		
	devise_for :users

	root :to => "pagina_inicial#index"	
end

CardapioNaMao::Application.routes.draw do
	match 'categorias_json' => 'categorias#all_categorias_from_user'
	match 'itens_json' => 'itens#all_itens_from_user'	
	match 'download' => redirect('/CardapioNaMao.apk')	
	match 'home' => 'pagina_inicial#index'
	match 'ajuda' => 'pagina_inicial#ajuda'
	
	resources :itens

	resources :categorias
		
	devise_for :users

	root :to => "pagina_inicial#index"	
end

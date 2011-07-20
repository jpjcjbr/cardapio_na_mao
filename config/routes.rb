CardapioNaMao::Application.routes.draw do
  resources :itens

	resources :categorias
		
	devise_for :users
	
	match 'categorias_json' => 'categorias#all_categorias_from_user'
	match 'itens_json' => 'itens#all_itens_from_user'	
	match 'download' => redirect('/CardapioNaMao.apk')	
	match 'home' => 'pagina_inicial#index'
	match 'ajuda' => 'pagina_inicial#ajuda'

	root :to => "pagina_inicial#index"	
end

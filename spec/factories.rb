Factory.define :user do |user|
  user.sequence(:email) { |n| "email#{n}@gmail.com"}
  user.password 'senhamtoloka'
end

Factory.define :categoria do |categoria|
  categoria.nome "Salada"
  categoria.association :user, :factory => :user
end

Factory.define :item do |item|
  item.nome "Saladrix"
  item.preco 19.00
  item.association :categoria, :factory => :categoria
end

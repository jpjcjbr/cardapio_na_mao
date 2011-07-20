Factory.define :user do |user|
  user.sequence(:email) { |n| "email#{n}@gmail.com"}
  user.password 'senhamtoloka'
end

Factory.define :categoria do |categoria|
  categoria.sequence(:nome) { |n| "Salada#{n}" }
  categoria.association :user, :factory => :user
end

Factory.define :item do |item|
  item.sequence(:nome) { |n| "Saladrix#{n}" }
  item.preco 19.00
  item.association :categoria, :factory => :categoria
end

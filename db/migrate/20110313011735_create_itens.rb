class CreateItens < ActiveRecord::Migration
  def self.up
    create_table :itens do |t|
      t.string :nome
      t.integer :categoria_id
      t.string :url_imagem
      t.string :descricao
      t.decimal :preco

      t.timestamps
    end
  end

  def self.down
    drop_table :itens
  end
end

class AddUserIdToCategoria < ActiveRecord::Migration
  def self.up
	add_column :categorias, :user_id, :integer
	
  end

  def self.down
	remove_column :categorias, :user_id
  end
end

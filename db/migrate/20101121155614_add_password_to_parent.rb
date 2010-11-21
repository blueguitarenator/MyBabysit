class AddPasswordToParent < ActiveRecord::Migration
  def self.up
    add_column :parents, :password, :string
  end

  def self.down
    remove_column :parents, :password
  end
end

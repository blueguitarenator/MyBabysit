class AddPasswordToBabysitter < ActiveRecord::Migration
  def self.up
    add_column :babysitters, :password, :string
  end

  def self.down
    remove_column :babysitters, :password
  end
end

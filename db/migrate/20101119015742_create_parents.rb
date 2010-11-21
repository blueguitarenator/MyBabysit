class CreateParents < ActiveRecord::Migration
  def self.up
    create_table :parents do |t|
      t.string :lastName
      t.string :firstName
      t.string :email
      t.string :city
      t.string :stateAbbr
      t.integer :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :parents
  end
end

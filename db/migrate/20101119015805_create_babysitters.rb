class CreateBabysitters < ActiveRecord::Migration
  def self.up
    create_table :babysitters do |t|
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
    drop_table :babysitters
  end
end

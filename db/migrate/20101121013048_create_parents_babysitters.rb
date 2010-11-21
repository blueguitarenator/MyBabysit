class CreateBabysittersParents < ActiveRecord::Migration
  def self.up
    create_table :babysitters_parents, :id => false do |t|
      t.integer :parent_id
      t.integer :babysitter_id
    end
  end

  def self.down
    drop_table :babysitters_parents
  end
end

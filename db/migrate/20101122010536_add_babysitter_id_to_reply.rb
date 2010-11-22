class AddBabysitterIdToReply < ActiveRecord::Migration
  def self.up
    add_column :replies, :babysitter_id, :integer
  end

  def self.down
    remove_column :replies, :babysitter_id
  end
end

class AddEventIdToReply < ActiveRecord::Migration
  def self.up
    add_column :replies, :event_id, :integer
  end

  def self.down
    remove_column :replies, :event_id
  end
end

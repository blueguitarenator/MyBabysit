class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.string :answer
      t.string :note
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :replies
  end
end

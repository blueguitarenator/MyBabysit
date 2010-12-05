class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.date :eventDate
      t.string :startTime
      t.string :endTime
      t.string :note
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

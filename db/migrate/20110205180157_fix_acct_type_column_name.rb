class FixAcctTypeColumnName < ActiveRecord::Migration
  def self.up
    rename_column :users, :accttype, :acct_type
  end

  def self.down
  end
end

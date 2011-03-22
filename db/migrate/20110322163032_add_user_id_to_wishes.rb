class AddUserIdToWishes < ActiveRecord::Migration
  def self.up
    add_column :wishes, :user_id, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :wishes, :user_id
  end
end
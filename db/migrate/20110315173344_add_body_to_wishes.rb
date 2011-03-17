class AddBodyToWishes < ActiveRecord::Migration
  def self.up
    add_column :wishes, :body, :text, :default => ""
  end

  def self.down
    remove_column :wishes, :body
  end
end
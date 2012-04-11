class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :members, :email, :unique => true
  end

  def self.down
    remove_index :members, :email
  end
end
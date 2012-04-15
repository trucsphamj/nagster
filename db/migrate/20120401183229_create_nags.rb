class CreateNags < ActiveRecord::Migration
  def self.up
    create_table :nags do |t|  
      t.string :content
      t.integer :member_id
      t.string :receiver_id

      t.timestamps
    end
    add_index :nags, [:member_id, :receiver_id, :created_at]
  end

  def self.down
    drop_table :nags
  end
end
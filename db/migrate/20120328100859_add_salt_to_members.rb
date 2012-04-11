class AddSaltToMembers < ActiveRecord::Migration
  def change
    add_column :members, :salt, :string

  end
end

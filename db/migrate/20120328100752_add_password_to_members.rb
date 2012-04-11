class AddPasswordToMembers < ActiveRecord::Migration
  def change
    add_column :members, :encrypted_password, :string

  end
end

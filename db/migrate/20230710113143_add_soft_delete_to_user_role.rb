class AddSoftDeleteToUserRole < ActiveRecord::Migration[7.0]
  def self.up
    add_column :users, :is_deleted, :boolean, :default => false
    add_column :users, :deleted_at, :datetime

    add_column :roles, :is_deleted, :boolean, :default => false
    add_column :roles, :deleted_at, :datetime
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
  def self.down
    remove_column :users, :is_deleted
    remove_column :users, :deleted_at

    remove_column :roles, :is_deleted
    remove_column :roles, :deleted_at
  end
end

class ChangeColumnUsers < ActiveRecord::Migration[7.0]
  def self.up
    change_table :users do |t|
      change_column :users, :contact, :string, null: false, :limit =>10
      #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    end
  end
  def self.down
    change_column :users, :contact, :integer
  end
end

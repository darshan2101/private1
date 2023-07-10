class CreateChatroomUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :chatroom_users do |t|
      t.references :chatroom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :is_deleted,default: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end

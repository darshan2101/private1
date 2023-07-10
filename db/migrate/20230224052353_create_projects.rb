class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 5, scale: 2
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :is_deleted,default: false
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end

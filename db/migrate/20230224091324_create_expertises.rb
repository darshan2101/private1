class CreateExpertises < ActiveRecord::Migration[7.0]
  def change
    create_table :expertises do |t|
      t.string :name
      t.boolean :is_deleted,default: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end

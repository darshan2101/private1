class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.text :local
      t.string :city
      t.string :state
      t.string :country
      t.integer :pincode, limit: 6
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

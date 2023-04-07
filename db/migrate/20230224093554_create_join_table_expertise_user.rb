class CreateJoinTableExpertiseUser < ActiveRecord::Migration[7.0]
  def change
    create_join_table :expertises, :users do |t|
      # t.index [:expertise_id, :user_id]
      # t.index [:user_id, :expertise_id]
    end
  end
end

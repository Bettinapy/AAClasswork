class CreateUserGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_goals do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.boolean :complete?, null: false, default: false
      t.boolean :private?, null: false, default: true

      t.timestamps
    end

    add_index :user_goals, :user_id
  end
end

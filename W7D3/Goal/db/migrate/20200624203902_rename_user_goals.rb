class RenameUserGoals < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_goals, :complete?, :complete
    rename_column :user_goals, :private?, :private
  end
end

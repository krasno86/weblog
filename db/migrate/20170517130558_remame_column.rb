class RemameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :avatars, :avatar
  end
end

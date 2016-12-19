class ChangeColumn < ActiveRecord::Migration[5.0]

  def up
    remove_column :users, :confirmed_at
    add_column :users, :confirmed_at, :datetime
  end

  def down
    add_column :users, :confirmed_at, :string
  end
end

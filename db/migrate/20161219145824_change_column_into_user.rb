class ChangeColumnIntoUser < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :confirmation_sent_at
    add_column :users, :confirmation_sent_at, :datetime
  end

  def down
    add_column :users, :confirmation_sent_at, :string
  end
end

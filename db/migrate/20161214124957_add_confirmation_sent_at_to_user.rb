class AddConfirmationSentAtToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :confirmation_sent_at, :string
  end
end

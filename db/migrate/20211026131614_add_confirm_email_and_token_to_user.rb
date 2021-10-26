class AddConfirmEmailAndTokenToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email_confirm, :boolean, :default => false
    add_column :users, :confirm_token, :string
  end
end

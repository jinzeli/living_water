class AddRememberTokenToCoworkers < ActiveRecord::Migration
  def change
    add_column :coworkers, :remember_token, :string
    add_index :coworkers, :remember_token
  end
end

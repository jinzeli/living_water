class AddAdminToCoworkers < ActiveRecord::Migration
  def change
    add_column :coworkers, :admin, :boolean, default: false
  end
end

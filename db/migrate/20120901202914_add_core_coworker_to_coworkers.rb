class AddCoreCoworkerToCoworkers < ActiveRecord::Migration
  def change
    add_column :coworkers, :core_coworker, :boolean
  end
end

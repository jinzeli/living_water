class AddCoreCoworkerToMinistries < ActiveRecord::Migration
  def change
    add_column :ministries, :core_coworker, :boolean
  end
end

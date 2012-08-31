# -*- encoding : utf-8 -*-
class CreateCoworkers < ActiveRecord::Migration
  def change
    create_table :coworkers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end

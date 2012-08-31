# -*- encoding : utf-8 -*-
class CreateMyMinistries < ActiveRecord::Migration
  def change
    create_table :my_ministries do |t|
      t.integer :coworker_id
      t.integer :ministry_id

      t.timestamps
    end
  end
end

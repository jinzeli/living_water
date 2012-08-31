# -*- encoding : utf-8 -*-
class AddIndexToCoworkersEmail < ActiveRecord::Migration
  def change
    add_index :coworkers, :email, unique: true
  end
end

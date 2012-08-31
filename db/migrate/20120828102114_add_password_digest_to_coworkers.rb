# -*- encoding : utf-8 -*-
class AddPasswordDigestToCoworkers < ActiveRecord::Migration
  def change
    add_column :coworkers, :password_digest, :string
  end
end

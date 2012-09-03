# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: ministries
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

# -*- encoding : utf-8 -*-

class Ministry < ActiveRecord::Base
  has_many :my_ministries, dependent: :destroy
  has_many :coworkers, through: :my_ministries
  attr_accessible :name, :description
  #before_destroy :ensure_not_referenced_by_any_my_ministry
  
  private
  
  def ensure_not_referenced_by_any_my_ministry
    if my_ministries.empty?
      return true
    else
      errors.state(:base, "还有人在 |我的事工|")
      return false
    end
  end
end

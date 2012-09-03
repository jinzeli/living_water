# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: my_ministries
#
#  id          :integer          not null, primary key
#  coworker_id :integer
#  ministry_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# -*- encoding : utf-8 -*-
class MyMinistry < ActiveRecord::Base
  belongs_to :ministry
  belongs_to :coworker
  attr_accessible  :coworker, :ministry, :ministry_id
end

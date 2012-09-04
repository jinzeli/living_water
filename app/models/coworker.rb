# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: coworkers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# -*- encoding : utf-8 -*-
class Coworker < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :admin, :core_coworker
  has_secure_password
  before_save { |coworker| coworker.email = email.downcase }
  before_save :create_remember_token
  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :admin, inclusion: { in: [true, false], message: ": 是不是管理员？" }
  validates :core_coworker, inclusion: { in: [true, false], message: ": 是不是同工？" }
  has_many :my_ministries, dependent: :destroy
  has_many :ministries, through: :my_ministries
  private 
    
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

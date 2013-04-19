# encoding: utf-8
class Admin < ActiveRecord::Base
  attr_accessible :name, :password, :username
  validates :username, :presence => {:message => "使用者資料輸入錯誤"}
  validates :password, :presence => {:message => "使用者資料輸入錯誤"}
  validates :username, :uniqueness  => {:message => "已有相同的使用者資料"}
end

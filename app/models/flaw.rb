# encoding: utf-8
class Flaw < ActiveRecord::Base
  attr_accessible :date, :issue, :status
  
  validates :issue, :presence => { :message => "議題不得為空白" }
  
  after_initialize :fill_defaults
  before_save :fill_defaults
  
  def fill_defaults
  
  	if self.status.nil?
  		self.status = "disable"
  	end
  	
  	if self.date.nil?
  		self.date = Time.now
  	end
  
  end
  
end

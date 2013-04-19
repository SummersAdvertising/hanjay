#encoding: utf-8
class Event < ActiveRecord::Base
  attr_accessible :date, :description, :link, :location, :period, :status, :title
  
  validates :title, :presence => { :message => "活動標題不得為空"}
  
  validates :link, :format => { :with => /^http(s)?:\/\/[\w\.\-\_\/:]+$/, :message => "請輸入正確網址格式" }
    
  after_initialize :fill_defaults
  before_create :fill_defaults
   
  def fill_defaults
  	if self.status.nil?
  		self.status = "disable"
  	end
  	
  	if self.date.nil?
  		self.date = Time.now
  	end
  end

  
end

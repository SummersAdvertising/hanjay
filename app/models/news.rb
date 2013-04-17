class News < ActiveRecord::Base
  has_many :newsphotos, :dependent => :destroy
  attr_accessible :content, :name, :newcreate, :status, :date

  paginates_per 5

  #delete the blank diretory built by carrierwave
  before_destroy :remember_id
  after_destroy :remove_id_directory
  
  before_save :fill_defaults

  protected
  
  def fill_defaults
  
  	if self.status.nil?
  		self.status = "disable"
  	end
  	
  	if self.date.nil?
  		self.date = Time.now
  	end
  
  end
 
  
  def remember_id
    @id = id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/Newsphoto/#{@id}", :force => true)
  end
end

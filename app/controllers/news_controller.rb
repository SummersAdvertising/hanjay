class NewsController < ApplicationController

  def index
    @news = News.where( "status = 'enable'" ).order('date DESC')
    
    @f_news = @news.first
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end
  def show

    respond_to do |format|
      format.html { 
	    @news = News.where( "status = 'enable'" ).order('date DESC')
	    @f_news = @news.first
	    @c_news = News.find(params[:id])
	    
	    $title = @c_news.name
	    $meta_content = ''
	    articles = JSON.parse(@c_news.content.gsub('\\', ''))
	    	    
	    articles[0..3].each do | a |
	    
	    next if a.nil? || a["type"] != 'paragraph'    
	    	$meta_content += a["content"]	    
	    end
	    
      	render :index 
      }
      format.js {
	    @news = News.find(params[:id])
	      
      }
    end
  end
end

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
	    @f_news = News.find(params[:id])
      	render :index 
      }
      format.js {
	    @news = News.find(params[:id])
	      
      }
    end
  end
end

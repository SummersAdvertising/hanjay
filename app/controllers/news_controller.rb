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
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @news }
    end
  end
end

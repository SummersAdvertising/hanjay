class FlawsController < ApplicationController

  # GET /flaws
  # GET /flaws.json
  def index
    @flaws = Flaw.where( :status => "enable" ).order("date DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flaws }
    end
  end
end

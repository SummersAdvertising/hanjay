# encoding: utf-8
class Admin::FlawsController < ApplicationController

  layout "admin"

  # GET /flaws
  # GET /flaws.json
  def index
    @flaws = Flaw.order("date DESC, created_at DESC").all
    
    @flaw = Flaw.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flaws }
    end
  end

  # GET /flaws/1
  # GET /flaws/1.json
  def show
    @flaw = Flaw.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flaw }
    end
  end

  # GET /flaws/new
  # GET /flaws/new.json
  def new
    @flaw = Flaw.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flaw }
    end
  end

  # GET /flaws/1/edit
  def edit
    @flaw = Flaw.find(params[:id])
  end

  # POST /flaws
  # POST /flaws.json
  def create
    @flaw = Flaw.new(params[:flaw])

    respond_to do |format|
      if @flaw.save
        format.html { redirect_to admin_flaws_path, notice: '新增完成' }
        format.json { render json: @flaw, status: :created, location: @flaw }
      else
        format.html { redirect_to admin_flaws_path }
        format.json { render json: @flaw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flaws/1
  # PUT /flaws/1.json
  def update
    @flaw = Flaw.find(params[:id])

    respond_to do |format|
      if @flaw.update_attributes(params[:flaw])
        format.html { redirect_to admin_flaws_path, notice: 'Flaw was successfully updated.' }
        format.js {}
      else
        format.html { render action: "edit" }
        format.json { render json: @flaw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flaws/1
  # DELETE /flaws/1.json
  def destroy
    @flaw = Flaw.find(params[:id])
    @flaw.destroy

    respond_to do |format|
      format.html { redirect_to flaws_url }
      format.json { head :no_content }
    end
  end
end

# -*- encoding : utf-8 -*-
class MyMinistriesController < ApplicationController
  # GET /my_ministries
  # GET /my_ministries.json
  def index
    @my_ministries = MyMinistry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_ministries }
    end
  end

  # GET /my_ministries/1
  # GET /my_ministries/1.json
  def show
    @my_ministry = MyMinistry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_ministry }
    end
  end

  # GET /my_ministries/new
  # GET /my_ministries/new.json
  def new
    @my_ministry = MyMinistry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_ministry }
    end
  end

  # GET /my_ministries/1/edit
  def edit
    @my_ministry = MyMinistry.find(params[:id])
  end

  # POST /my_ministries
  # POST /my_ministries.json
  def create
    @my_ministry = MyMinistry.new(params[:my_ministry])

    respond_to do |format|
      if @my_ministry.save
        format.html { redirect_to @my_ministry, notice: 'My ministry was successfully created.' }
        format.json { render json: @my_ministry, status: :created, location: @my_ministry }
      else
        format.html { render action: "new" }
        format.json { render json: @my_ministry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_ministries/1
  # PUT /my_ministries/1.json
  def update
    @my_ministry = MyMinistry.find(params[:id])

    respond_to do |format|
      if @my_ministry.update_attributes(params[:my_ministry])
        format.html { redirect_to @my_ministry, notice: 'My ministry was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_ministry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_ministries/1
  # DELETE /my_ministries/1.json
  def destroy
    @my_ministry = MyMinistry.find(params[:id])
    @my_ministry.destroy

    respond_to do |format|
      format.html { redirect_to my_ministries_url }
      format.json { head :ok }
    end
  end
end

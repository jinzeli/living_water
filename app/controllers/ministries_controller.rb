# -*- encoding : utf-8 -*-
class MinistriesController < ApplicationController
  before_filter :signed_in_coworker, only: [:index, :show]
  before_filter :core_coworker, only: [:index, :show, :create, :update, :destroy]
  before_filter :admin_coworker, only: [:new, :edit]
  # GET /ministries
  # GET /ministries.json
  def index
    @ministries = Ministry.all
    @coworker = current_coworker
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ministries }
    end
  end

  # GET /ministries/1
  # GET /ministries/1.json
  def show
    @ministry = Ministry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ministry }
    end
  end

  # GET /ministries/new
  # GET /ministries/new.json
  def new
    @ministry = Ministry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ministry }
    end
  end

  # GET /ministries/1/edit
  def edit
    @ministry = Ministry.find(params[:id])
  end

  # POST /ministries
  # POST /ministries.json
  def create
    @ministry = Ministry.new(params[:ministry])

    respond_to do |format|
      if @ministry.save
        format.html { redirect_to @ministry, notice: '建立了一个事工小组' }
        format.json { render json: @ministry, status: :created, location: @ministry }
      else
        format.html { render action: "new" }
        format.json { render json: @ministry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ministries/1
  # PUT /ministries/1.json
  def update
    @ministry = Ministry.find(params[:id])

    respond_to do |format|
      if @ministry.update_attributes(params[:ministry])
        format.html { redirect_to @ministry, notice: '更新了一个事工小组' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ministry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ministries/1
  # DELETE /ministries/1.json
  def destroy
    @ministry = Ministry.find(params[:id])
    @ministry.destroy
    flash[:success] = "删除了一个事工小组"
    respond_to do |format|
      format.html { redirect_to ministries_url }
      format.json { head :ok }
    end
  end
end

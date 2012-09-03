# -*- encoding : utf-8 -*-
class CoworkersController < ApplicationController
  before_filter :signed_in_coworker, only: [:edit, :update, :index, :show]
  before_filter :correct_coworker,   only: [:edit, :update]
  before_filter :admin_coworker, only: [:new, :create, :destroy]
  # GET /coworkers
  # GET /coworkers.json
  def index
    @coworkers = Coworker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coworkers }
    end
  end

  # GET /coworkers/1
  # GET /coworkers/1.json
  def show
    @coworker = Coworker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coworker }
    end
  end

  # GET /coworkers/new
  # GET /coworkers/new.json
  def new
    @coworker = Coworker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coworker }
    end
  end

  # GET /coworkers/1/edit
  def edit
    @coworker = Coworker.find(params[:id])
  end

  # POST /coworkers
  # POST /coworkers.json
  def create
    @coworker = Coworker.new(params[:coworker])

    respond_to do |format|
      if @coworker.save
        sign_in @coworker
        flash[:success] = "新人成功加添到 爱服事 | iMinistry！"
        format.html { render action: "show" }
        format.json { render json: @coworker, status: :created, location: @coworker }
      else
        format.html { render action: "new" }
        format.json { render json: @coworker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coworkers/1
  # PUT /coworkers/1.json
  def update
    @coworker = Coworker.find(params[:id])

    respond_to do |format|
      if @coworker.update_attributes(params[:coworker])
        flash[:success] = "已经更改了哦"
        sign_in @coworker
        format.html { render action: "show" }
      else
        format.html { render action: "edit" }
        format.json { render json: @coworker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coworkers/1
  # DELETE /coworkers/1.json
  def destroy
    @coworker = Coworker.find(params[:id])
    @coworker.destroy

    respond_to do |format|
      format.html { redirect_to coworkers_url }
      format.json { head :ok }
    end
  end
end

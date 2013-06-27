class CostumersController < ApplicationController
  # GET /costumers
  # GET /costumers.json

  before_filter :authenticate_user! #, :except => [:show, :index]
  before_filter :get_current_costumer, only: [:show, :edit, :update, :destroy]

  def index
    @costumers = current_user.costumers

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @costumers }
    end
  end

  # GET /costumers/1
  # GET /costumers/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @costumer }
    end
  end

  # GET /costumers/new
  # GET /costumers/new.json
  def new
    @costumer = current_user.costumers.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @costumer }
    end
  end

  # GET /costumers/1/edit
  def edit
  end

  # POST /costumers
  # POST /costumers.json
  def create
    @costumer = current_user.costumers.build(params[:costumer])

    respond_to do |format|
      if @costumer.save
        format.html { redirect_to @costumer, notice: 'El Cliente fue creado en forma satisfactoria.' }
        format.json { render json: @costumer, status: :created, location: @costumer }
      else
        format.html { render action: "new" }
        format.json { render json: @costumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /costumers/1
  # PUT /costumers/1.json
  def update
    respond_to do |format|
      if @costumer.update_attributes(params[:costumer])
        format.html { redirect_to @costumer, notice: 'El Cliente fue Actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @costumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costumers/1
  # DELETE /costumers/1.json
  def destroy
    @costumer.destroy

    respond_to do |format|
      format.html { redirect_to costumers_url, notice: 'El Cliente fue Eliminado.' }
      format.json { head :no_content }
    end
  end

protected
  def get_current_costumer
    @costumer = current_user.costumers.find(params[:id])
  end
end

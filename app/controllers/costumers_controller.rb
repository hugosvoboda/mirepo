class CostumersController < ApplicationController
  # GET /costumers
  # GET /costumers.json
  def index
    @costumers = Costumer.where("user_id = '#{current_user.id}'")
                                  #user_id LIKE '%#{params[:first_name]}%'")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @costumers }
    end
  end

  # GET /costumers/1
  # GET /costumers/1.json
  def show
    @costumer = Costumer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @costumer }
    end
  end

  # GET /costumers/new
  # GET /costumers/new.json
  def new
    @costumer = Costumer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @costumer }
    end
  end

  # GET /costumers/1/edit
  def edit
    @costumer = Costumer.find(params[:id])
  end

  # POST /costumers
  # POST /costumers.json
  def create
    @costumer = Costumer.new(params[:costumer])
    @costumer.user_id = current_user.id

    respond_to do |format|
      if @costumer.save
        format.html { redirect_to @costumer, notice: 'Costumer was successfully created.' }
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
    @costumer = Costumer.find(params[:id])

    respond_to do |format|
      if @costumer.update_attributes(params[:costumer])
        format.html { redirect_to @costumer, notice: 'Costumer was successfully updated.' }
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
    @costumer = Costumer.find(params[:id])
    @costumer.destroy

    respond_to do |format|
      format.html { redirect_to costumers_url }
      format.json { head :no_content }
    end
  end
end
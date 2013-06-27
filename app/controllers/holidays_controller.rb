class HolidaysController < ApplicationController
  # GET /holidays
  # GET /holidays.json

  before_filter :authenticate_user! #, :except => [:show, :index]
  before_filter :get_current_holiday, only: [:show, :edit, :update, :destroy]

  def index
    @holidays = current_user.holidays

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holidays }
    end
  end

  # GET /holidays/1
  # GET /holidays/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @holiday }
    end
  end

  # GET /holidays/new
  # GET /holidays/new.json
  def new
    @holiday = current_user.holidays.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @holiday }
    end
  end

  # GET /holidays/1/edit
  def edit
  end

  # POST /holidays
  # POST /holidays.json
  def create
    @holiday = current_user.holidays.build(params[:holiday])

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to @holiday, notice: 'El Feriado fue creado en forma satisfactoria.' }
        format.json { render json: @holiday, status: :created, location: @holiday }
      else
        format.html { render action: "new" }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /holidays/1
  # PUT /holidays/1.json
  def update
    respond_to do |format|
      if @holiday.update_attributes(params[:holiday])
        format.html { redirect_to @holiday, notice: 'El Feriado fue Actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.json
  def destroy
    @holiday.destroy

    respond_to do |format|
      format.html { redirect_to holidays_url, notice: 'El Feriado fue Eliminado.' }
      format.json { head :no_content }
    end
  end

protected
  def get_current_holiday
    @holiday = current_user.holidays.find(params[:id])
  end
end

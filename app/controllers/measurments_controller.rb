class MeasurmentsController < ApplicationController
  before_action :measurment, only: [:show, :edit, :update, :destroy]

  # GET /measurments
  # GET /measurments.json
  def index
    @measurments = Measurment.all
  end

  # GET /measurments/1
  # GET /measurments/1.json
  def show
  end

  # GET /measurments/new
  def new
    @measurment = Measurment.new
  end

  # GET /measurments/1/edit
  def edit
  end

  # POST /measurments
  # POST /measurments.json
  def create
    @measurment = Measurment.new(measurment_params)

    respond_to do |format|
      if @measurment.save
        format.html { redirect_to @measurment, notice: 'Measurment was successfully created.' }
        format.json { render :show, status: :created, location: @measurment }
      else
        format.html { render :new }
        format.json { render json: @measurment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurments/1
  # PATCH/PUT /measurments/1.json
  def update
    respond_to do |format|
      if @measurment.update(measurment_params)
        format.html { redirect_to @measurment, notice: 'Measurment was successfully updated.' }
        format.json { render :show, status: :ok, location: @measurment }
      else
        format.html { render :edit }
        format.json { render json: @measurment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurments/1
  # DELETE /measurments/1.json
  def destroy
    @measurment.destroy
    respond_to do |format|
      format.html { redirect_to measurments_url, notice: 'Measurment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurment
      @measurment = Measurment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def measurment_params
      params.require(:measurment).permit(:weight, :type, :date)
    end
end

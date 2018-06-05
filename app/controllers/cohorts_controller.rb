class CohortsController < ApplicationController
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]

  # GET /cohorts
  # GET /cohorts.json
  def index
    @cohorts = Cohort.all.order(:id)
  end

  # GET /cohorts/1
  # GET /cohorts/1.json
  def show
    @cohorts = Cohort.find(params[:id])
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
  end

  # GET /cohorts/1/edit
  def edit
    @cohort = Cohort.find(params[:id]) 
  end

  # POST /cohorts
  # POST /cohorts.json
  def create
    @cohort = Cohort.new(cohort_params)

    respond_to do |format|
      if @cohort.save
        format.js {puts "save cohort with js"}
        format.html { redirect_to @cohort, notice: 'Cohort was successfully created.' }
        format.json { render :show, status: :created, location: @cohort }
      else
        format.error
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cohorts/1
  # PATCH/PUT /cohorts/1.json
  def update
    @cohort = Cohort.find(params[:id])
    @cohort.update(cohort_params)

    respond_to do |format|
      if @cohort.update(cohort_params)
      
        format.html { redirect_to @cohort, notice: 'Cohort was successfully updated.' }
        format.json { render :show, status: :ok, location: @cohort }
      else
        format.html { render :edit }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohorts/1
  # DELETE /cohorts/1.json
  def destroy
    @cohort = Cohort.find(params[:id])
    @cohort.destroy

    respond_to do |format|
      format.html { redirect_to cohorts_url, notice: 'Cohort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      @cohort = Cohort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cohort_params
      params.require(:cohort).permit(:name, :start_date, :end_date, :course_id)
    end
end

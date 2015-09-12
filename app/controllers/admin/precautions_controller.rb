class Admin::PrecautionsController < AdminController
  before_action :set_precaution, only: [:show, :edit, :update, :destroy]

  # GET /precautions
  # GET /precautions.json
  def index
    @search_precautions = Precaution.order(created_at: :desc).ransack(params[:q])
    @precautions = @search_precautions.result(distinct: true).page(params[:page])
  end

  # GET /precautions/1
  # GET /precautions/1.json
  def show
  end

  # GET /precautions/new
  def new
    @precaution = Precaution.new
  end

  # GET /precautions/1/edit
  def edit
  end

  # POST /precautions
  # POST /precautions.json
  def create
    @precaution = Precaution.new(precaution_params)

    respond_to do |format|
      if @precaution.save
        format.html { redirect_to [:admin, @precaution], notice: 'Precaution was successfully created.' }
        format.json { render :show, status: :created, location: @precaution }
      else
        format.html { render :new }
        format.json { render json: @precaution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /precautions/1
  # PATCH/PUT /precautions/1.json
  def update
    respond_to do |format|
      if @precaution.update(precaution_params)
        format.html { redirect_to [:admin, @precaution], notice: 'Precaution was successfully updated.' }
        format.json { render :show, status: :ok, location: @precaution }
      else
        format.html { render :edit }
        format.json { render json: @precaution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /precautions/1
  # DELETE /precautions/1.json
  def destroy
    @precaution.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, precautions_url], notice: 'Precaution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_precaution
      @precaution = Precaution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def precaution_params
      params.require(:precaution).permit(:description, :video_url, disease_ids: [])
    end
end

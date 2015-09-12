class Admin::ServicesController < AdminController
  before_action :set_admin_service, only: [:show, :edit, :update, :destroy]

  # GET /admin/services
  def index
    @search_admin_services = Service.order(created_at: :desc).ransack(params[:q])
    @admin_services = @search_admin_services.result(distinct: true).page(params[:page])
  end

  # GET /admin/services/1
  def show
  end

  # GET /admin/services/new
  def new
    @admin_service = Service.new
  end

  # GET /admin/services/1/edit
  def edit
  end

  # POST /admin/services
  def create
    @admin_service = Service.new(admin_service_params)

    if @admin_service.save
      redirect_to [:admin, @admin_service], notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/services/1
  def update
    if @admin_service.update(admin_service_params)
      redirect_to [:admin, @admin_service], notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/services/1
  def destroy
    @admin_service.destroy
    redirect_to admin_services_url, notice: 'Service was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_service
      @admin_service = Service.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_service_params
      params[:service].permit(:name, :description)
    end
end

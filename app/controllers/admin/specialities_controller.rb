class Admin::SpecialitiesController < ApplicationController
  before_action :set_admin_speciality, only: [:show, :edit, :update, :destroy]

  # GET /admin/specialities
  def index
    @search_admin_specialities = Speciality.order(created_at: :desc).ransack(params[:q])
    @admin_specialities = @search_admin_specialities.result(distinct: true).page(params[:page])
  end

  # GET /admin/specialities/1
  def show
  end

  # GET /admin/specialities/new
  def new
    @admin_speciality = Speciality.new
  end

  # GET /admin/specialities/1/edit
  def edit
  end

  # POST /admin/specialities
  def create
    @admin_speciality = Speciality.new(admin_speciality_params)

    if @admin_speciality.save
      redirect_to [:admin, @admin_speciality], notice: 'Speciality was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/specialities/1
  def update
    if @admin_speciality.update(admin_speciality_params)
      redirect_to [:admin, @admin_speciality], notice: 'Speciality was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/specialities/1
  def destroy
    @admin_speciality.destroy
    redirect_to admin_specialities_url, notice: 'Speciality was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_speciality
      @admin_speciality = Speciality.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_speciality_params
      params.require(speciality).permit(:name, :description)
    end
end

class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_application, only: %i[ show edit update destroy ]
  before_action :check_admin, only: [:index, :new, :show, :create, :update, :destroy, :disponibles, :disponiblescreate]

  # GET /applications or /applications.json
  def index
    user_id = current_user.id
    @applications = JobPost.where(id: Application.where(user_id: user_id).select(:job_post_id)).order(created_at: :desc).page(params[:page]).per(5)
    @desde = "disponibles"
    
  end

  # GET /applications/1 or /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications or /applications.json
  def create
    @application = Application.new(application_params)
    
    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: "Application was successfully created." }
        format.json { render :disponibles, status: :created, location: @application }
      else
        format.html { render :disponibles, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1 or /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: "Application was successfully updated." }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1 or /applications/1.json
  def destroy
    @application.destroy!

    respond_to do |format|
      format.html { redirect_to applications_path, status: :see_other, notice: "Application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def disponibles
    
    user_id = current_user.id
    @disponibles = JobPost.where.not(id: Application.where(user_id: user_id).select(:job_post_id)).order(created_at: :desc).page(params[:page]).per(5)
    @desde = "disponibles"
       
  end
  # POST /applications or /applications.json
  def disponiblescreate
    Rails.logger.debug "Parámetros: #{application_params.inspect}"
    @application = Application.new(application_params)
    
    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: "Application was successfully created." }
        format.json { render :disponibles, status: :created, location: @application }
      else
        format.html { render :disponibles, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def application_params
      params.require(:application).permit(:user_id, :job_post_id, :status)
    end

    def check_admin
        unless current_user.present? && (current_user.role == 'admin' || current_user.role == 'user')
          redirect_to root_path, alert: 'No tienes permisos para acceder a esta sección.'
        end
    end
end

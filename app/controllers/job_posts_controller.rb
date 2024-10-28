class JobPostsController < ApplicationController
    before_action :authenticate_user!
   
    before_action :check_admin, only: [:index, :new, :show, :create, :update, :destroy]
    before_action :set_jobpost, only: %i[ show edit update destroy ]


    def index
        @job_post = JobPost.order(created_at: :desc).page(params[:page]).per(5)
        @desde = "index"
        session[:count_appli]  = Application.joins(:user, :job_post)
            .where(status: 'Nueva-Postulación')
            .select('*').count
    end

    def show
        @desde = "show"
    end
    
    
    def new
        @job_post = JobPost.new
        @desde = "new"
    end
    
    def edit
        @desde = "edit"
    end

    
    def create
        @job_post = JobPost.new(jobpost_params)

        respond_to do |format|
        if @job_post.save
            format.html { redirect_to @job_post, notice: "Job was successfully created." }
            format.json { render :show, status: :created, location: @job_post }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @job_post.errors, status: :unprocessable_entity }
        end
        end
    end
    def update
        respond_to do |format|
            if @job_post.update(jobpost_params)
            format.html { redirect_to @job_post, notice: "Job was successfully updated." }
            format.json { render :show, status: :ok, location: @job_post }
            else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @job_post.errors, status: :unprocessable_entity }
            end
        end
    end
    def destroy
        @job_post.destroy!

        respond_to do |format|
            format.html { redirect_to job_posts_path, status: :see_other, notice: "Job was successfully destroyed." }
            format.json { head :no_content }
        end
    end
    def notificaciones
        @notificaciones = Application.joins(:user, :job_post)
            .where(status: 'Nueva-Postulación')
            .select('users.name, users.email, job_posts.title, applications.created_at').order(created_at: :desc).page(params[:page]).per(5)
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobpost
      @job_post = JobPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jobpost_params
      params.require(:job_post).permit(:title, :description, :created_by_id)
    end
    def check_admin
      unless current_user.present? && current_user.role == 'admin'
        redirect_to root_path, alert: 'No tienes permisos para acceder a esta sección.'
      end
    end

end

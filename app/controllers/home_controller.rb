class HomeController < ApplicationController
    def index

        @home = JobPost.order(created_at: :desc).page(params[:page]).per(5)
    end
    def redirect_to_home
      redirect_to root_path
    end
end

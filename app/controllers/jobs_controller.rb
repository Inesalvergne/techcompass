class JobsController < ApplicationController
  # I can see all my jobs
  def index
    @jobs = current_user.jobs
  end

  # I can see details of a job
  def show
    @job = Job.find(params[:id])
  end

  # I can add a job
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  # I can change the status of a job

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:company, :description, :location, :role,
                                :level, :post_url, :interview_date, :remote,
                                :status)
  end
end

class JobsController < ApplicationController
   before_action :authenticate_user! , only: [:new, :edit, :create, :update, :destroy]
  def index


    @q = Job.where(:status=> "public").ransack(params[:q])
    @jobs = @q.result.rank(:row_order)

 end

  def new
  @job = Job.new
  end

  def show
  @job = Job.find(params[:id])

  end
  def edit
    @job = Job.find(params[:id])

  end

  def create
    @job = Job.new(job_params)
    if @job.save
    redirect_to jobs_path
  else
    render :new

  end
  end

  def update
    @job = Job.find(params[:id])
  if  @job.update(job_params)

    redirect_to jobs_path,notice: "Update Success"
  else
    render :edit
  end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path,alert: "Job delelted!"
  end

private

   def job_params
     params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
   end
end

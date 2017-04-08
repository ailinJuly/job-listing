class JobsController < ApplicationController
   before_action :authenticate_user! , only: [:new]
  def index
   @jobs = Job.all
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


end

class Admin::JobsController< ApplicationController
   before_action :authenticate_user! , only: [:new, :edit, :create, :update, :destroy]
   before_action :require_is_admin
   def index
    @jobs = Job.rank(:row_order).all
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
     redirect_to admin_jobs_path
   else
     render :new

   end
   end

   def update
     @job = Job.find(params[:id])
   if  @job.update(job_params)

     redirect_to admin_jobs_path,notice: "Update Success"
   else
     render :edit
   end
   end

   def destroy
     @job = Job.find(params[:id])
     @job.destroy
     redirect_to admin_jobs_path,alert: "Job delelted!"
   end

   def bulk_update
     total = 0
     Array(params[:ids]).each do |job_id|
       job = Job.find(job_id)
      if params[:commit] == I18n.t(:bulk_delete)
        job.destroy
        total += 1
        flash[:alert] = "成功完成#{total}笔删除！"
      elsif
        params[:commit]== I18n.t(:bulk_update)
        job.status = params[:job_status]
        if job.save
          total += 1
          flash[:alert] = "成功完成#{total}笔更新！"
        end
      end
     end
     redirect_to admin_jobs_path
   end

   def reorder
     @job = Job.find(params[:id])
     @job.row_order_position = params[:position]
     @job.save!
     respond_to do |format|
       format.html { redirect_to admin_jobs_path }
       format.json { render :json => { :message => "ok" }}
    end
   end
private


   def job_params
     params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :status, :contact_email)
   end
end

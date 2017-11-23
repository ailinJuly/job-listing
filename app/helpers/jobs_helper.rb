module JobsHelper
  def render_job_status(job)
    if job.status == "public"
      "(Public)"
    else
      "(Hidden)"
    end
  end


  # def registration_filters(options)
  #       params.permit(:status, :ticket_id).merge(options)
  # end
end

module JobsHelper
  def render_job_status(job)
    if job.status == "public"
      "(Public)"
    else
      "(Hidden)"
    end
  end
end

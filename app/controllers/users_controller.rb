require "date"

class UsersController < ApplicationController
  # Dashboard functions:
  # I can see my dashboard
  # I can see my built-in KPIs
  # I can see the four most recent jobs I've made
  # I can see how many credits I have
  def dashboard
    @jobs = current_user.jobs
    @goal = current_user.goals.order(created_at: :desc).first
    @new_goal = Goal.new
    @new_goal.user = current_user
    if @goal.nil?
      @jobs = nil
    else
      @jobs = @goal.jobs.order(created_at: :desc).first(4)
    end
    @resources = current_user.resources.order(created_at: :desc).first(4)

    # date
    @today = Date.today.to_s(:long)

    # I can see updated KPIs on my dashboard
    @applications_total = current_user.jobs.nil? ? 0 : current_user.jobs.count
    @interviews_total = Job.where(status: "Interview").count
    @my_resources_total = Resource.where(user: current_user).count
    @applications_left_to_reach_goal = (@goal.job_target - @applications_total)

    # I can see the last 4 applications I sent
    @jobs_preview = current_user.jobs.last(4)
  end
end

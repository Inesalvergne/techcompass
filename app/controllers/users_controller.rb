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
    @resources = Resource.where(user: current_user).order(created_at: :desc).first(4)

    # date
    @today = Date.today.to_s(:long)

    # I can see updated KPIs on my dashboard
    @applications_total = current_user.jobs.nil? ? 0 : (current_user.jobs.count - current_user.jobs.where(status: "Wishlist").count)
    @interviews_total = Job.where(status: "Interview").count
    @my_resources_total = Resource.where(user: current_user).count
    @applications_left_to_reach_goal = current_user.goals.empty? ? "N/A" : (@goal.job_target - @applications_total)
    if @applications_total.zero?
      @applications_to_interview_ratio = 0
    else
      @applications_to_interview_ratio = ((@interviews_total / @applications_total.to_f) * 100).round
    end
    # I can see the last 4 applications I sent
    @jobs_preview = current_user.jobs.where(status: ['Applied', 'Interview', 'Decision', 'Offer', 'Rejected']).last(4)

    # respond_to do |format|
    #   format.html { redirect_to dashboard_path }
    #   format.text { render partial: 'shared/kpi_card', locals: {
    #                 applications_total: @applications_total,
    #                 interviews_total: @interviews_total,
    #                 my_resources_total: @my_resources_total,
    #                 applications_left_to_reach_goal: @applications_left_to_reach_goal },
    #                 formats: [:html] }
    # end
  end
end

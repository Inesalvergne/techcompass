class GoalsController < ApplicationController
  # I can add a goal
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  # I can edit a goal

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @applications_total = current_user.jobs.nil? ? 0 : current_user.jobs.count
    @interviews_total = Job.where(status: "Interview").count
    @my_resources_total = Resource.where(user: current_user).count
    @applications_left_to_reach_goal = current_user.goals.empty? ? "N/A" : (@goal.job_target - @applications_total)
    @goal.update(goal_params)
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.text { render partial: 'shared/goal_card', locals: { goal: @goal, jobs: @goal.jobs }, formats: [:html] }
        # variant.kpi { render partial: 'shared/kpi_card', locals: {
        #               applications_total: @applications_total,
        #               interviews_total: @interviews_total,
        #               my_resources_total: @my_resources_total,
        #               applications_left_to_reach_goal: @applications_left_to_reach_goal },
        #               formats: [:html] }
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:job_target, :description)
  end
end

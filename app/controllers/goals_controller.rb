class GoalsController < ApplicationController
  # I can add a goal
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to user_path(current_user)
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
    if @goal.update(goal_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:job_target, :description)
  end
end

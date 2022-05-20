class UsersController < ApplicationController
  # Dashboard functions:
  # I can see my dashboard
  # I can see my built-in KPIs
  # I can see the four most recent jobs I've made
  # I can see how many credits I have
  def dashboard
    @goal = current_user.goals.order(created_at: :desc).first
    @new_goal = Goal.new
    @new_goal.user = current_user
    @jobs = @goal.jobs.order(created_at: :desc).first(4)
  end
end

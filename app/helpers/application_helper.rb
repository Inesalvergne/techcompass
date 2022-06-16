module ApplicationHelper

  def active?(action, controller)
    "active" if params[:action] == action && params[:controller] == controller
  end
end

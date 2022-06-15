module ApplicationHelper

  def active?(page_name)
    "active" if params[:action] == page_name
  end
end

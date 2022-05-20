class ResourcesController < ApplicationController
  # I can search and filter resources posted by others
  # Can be filtered by company, job position, and keyword
  def index
    if params[:query].present?
      @resources = Resource.search_by_title_and_author(params[:query])
    else
      @resources = Resource.all
    end
  end

  def my_resources
    @resources = current_user.resources
  end

  # I can use credits to access resources
  def show
    @resource = Resource.find(params[:id])

    return if @resource.user == current_user

    current_user.credits -= 1
    current_user.save
  end

  # I can create a resource
  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    if @resource.save
      redirect_to resource_path(@resource)
    else
      render :new
    end
  end

  # 'COULD HAVE' methods below

  # I can upvote someone else's resources
  def upvote
  end

  # I can practice for an interview with flashcards
  def toggle_favorite
  end

  private

  def resource_params
    params.require(:resource).permit(:content, :title, :summary, :votes, :level, :tags)
  end
end

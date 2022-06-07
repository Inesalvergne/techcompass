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
    @resources = Resource.where(user: current_user)
  end

  # I can use credits to access resources
  def show
    @resource = Resource.find(params[:id])
    # if user has enough credit and has not viewed the resource before
    # create a view

    return if @resource.user == current_user || current_user.viewed?(@resource)
    # send a param from the link_to indicating the user is purchasing article
  end

  def purchase_resource
    @resource = Resource.find(params[:id])
    respond_to do |format|
      if current_user.credits >= 5
        if View.create!(user: current_user, resource: @resource)
          current_user.credits -= 5
          current_user.save
          format.json { render json: true }
        end
      else
        format.json { render json: false }
      end
    end
  end

  # I can create a resource
  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    @resource.votes = 0
    if @resource.save
      current_user.credits += 15
      current_user.save
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
    params.require(:resource).permit(:content, :rich_content, :title, :summary, :votes, :level, :tags, :image)
  end
end

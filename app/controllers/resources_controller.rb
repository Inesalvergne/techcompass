class ResourcesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # I can search and filter resources posted by others
  # Can be filtered by company, job position, and keyword
  def index
    if Resource.search_by_title_and_author(params[:query]).empty? && Resource.where("tags = ?", params[:tags]).empty?
      @resources = Resource.all
    elsif Resource.search_by_title_and_author(params[:query]).present? && Resource.where("tags = ?", params[:tags]).present?
      @resources = Resource.search_by_title_and_author(params[:query]).where("tags = ?", params[:tags])
    elsif params[:query].present?
      @resources = Resource.search_by_title_and_author(params[:query])
    elsif params[:tags].present?
      @resources = Resource.where("tags = ?", params[:tags])
    elsif params[:query].empty?
      @resources = Resource.all
    elsif Resource.where("tags = ?", params[:tags]).empty?
      @resources = Resource.all
    else
      @resources = Resource.all
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/resources', locals: { resources: @resources }, formats: [:html] }
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
    @resource = Resource.find(params[:id])
    @resource.increment(:votes)
    respond_to do |format|
      if @resource.save
        format.json {render json: @resource.votes}
      end
    end
  end

  # I can practice for an interview with flashcards
  def toggle_favorite
  end

  private

  def resource_params
    params.require(:resource).permit(:content, :rich_content, :title, :summary, :votes, :level, :tags, :image)
  end
end

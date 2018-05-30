class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to @topic, notice: "#{@topic.name} was successfully created!"
    else
      flash.now[:alert] = "Failed to create #{@topic.name}, please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
      redirect_to @topic, notice: "Changes saved to."
    else
      flash.now[:alert] = "Failed to save changes."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      redirect_to topics_path, notice: "Successfully deleted #{@topic.name}"
    else
      flash.now[:alert] = "Failed to delete #{@topic.name}"
      render :show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

end

class TopicsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :destroy]

  def index
    @topics = Topic.page(params[:page])
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
      redirect_to topics_path
    else
      render :new
    end
  end


  private

  def topic_params
    params.require(:topic).permit(:title, :content)
  end

end


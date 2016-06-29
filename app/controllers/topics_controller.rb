class TopicsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :destroy]

  def about
  end

  def index

    if params[:cid]
       category = Category.find(params[:cid])
       @topics = category.topics
    else
       @topics = Topic.all
    end

       @q = @topics.ransack(params[:q])
       @topics = @q.result(distinic: true).page(params[:page])
  end

  def show
    @topic = Topic.find(params[:id])

    unless cookies["view-topic-#{@topic.id}"]
      cookies["view-topic-#{@topic.id}"] = "true"
      @topic.view!
    end

    @comment = Comment.new

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

  def destroy
    @topic = Topic.find( params(:id) )

    if @topic.can_delete_by?(current_user)
      @topic.destroy
    end

    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :content, :category_ids => [])
  end


end


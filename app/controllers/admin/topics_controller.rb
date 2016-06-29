class Admin::TopicsController < ApplicationController

  before_action :authenticate_user!

  before_action :check_admin

  layout "admin"

  def index
    @topic = Topic.all
  end



  protected

    def check_admin
      unless current_user.admin?
        raise ActiveRecord::RecordNotFound
      end
    end

end

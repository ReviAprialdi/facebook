class StatusesController < ApplicationController
  before_action :authenticate_user!
  def index
    @statuses = Status.all.order("statuses.created_at desc")
  end

  def create
    @status = Status.new(params.require(:status).permit(:status))
    @status.user_id = current_user.id
    @status.save
  end
  
  def show
    @status = Status.find(params[:id])
  end
end

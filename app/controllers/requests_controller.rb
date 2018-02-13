class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to requests_path
    else
      render 'new'
    end
  end

  def index
    @requests = get_collection
  end

  private

  def get_collection
    params[:participant_id] ? Participant.find(params[:participant_id]).requests : Request.all
  end

  def request_params
    params.require(:request).permit(:is_ill, :appeared, :participant_id, :competition_id)
  end
end

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

  def download_list
    @requests = Request.find(params[:request_ids])
    respond_to do |format|
      format.docx { render docx: 'requests_list', filename: 'requests_list.docx' }
    end
  end

  private

  def get_collection
    (params[:participant_id] || params[:competition_id]) ? Request.where('participant_id = ? OR competition_id = ?',
      params[:participant_id], params[:competition_id]) : Request.all
  end

  def request_params
    params.require(:request).permit(:is_ill, :appeared, :participant_id, :competition_id)
  end
end

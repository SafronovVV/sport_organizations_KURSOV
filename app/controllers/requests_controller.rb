class RequestsController < ApplicationController
  before_action :find_request, only: %i[edit update]
  respond_to :docx

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
    @q = Request.ransack(params[:q])
    @requests = @q.result
  end

  def edit;end

  def update
    if @request.update(request_params)
      redirect_to requests_path
    else
      render 'edit'
    end
  end

  def download_list
    @requests = Request.find(params[:request_ids])
    respond_to do |format|
      format.docx { render docx: 'requests_list', filename: 'requests_list.docx' }
    end
  end

  private

  def find_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:is_ill, :appeared, :participant_id, :competition_id)
  end
end

class ResultsController < ApplicationController
  before_action :find_result, only: [:edit, :update]
  respond_to :docx

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to results_path
    else
      render 'new'
    end
  end

  def index
    @q = Result.ransack(params[:q])
    @results = @q.result
  end

  def edit; end

  def update
    if @result.update(result_params.except(:request_id))
      redirect_to results_path
    else
      render 'edit'
    end
  end

  def download_list
    @results = Result.find(params[:result_ids])
    respond_to do |format|
      format.docx { render docx: 'results_report', filename: 'results_report.docx' }
    end
  end

  private
  def find_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit(:place, :height_result, :length_result, :score, :request_id)
  end
end

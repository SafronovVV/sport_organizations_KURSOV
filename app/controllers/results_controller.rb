class ResultsController < ApplicationController

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
    @results = get_collection
  end

  private

  def get_collection
    params[:request_id] ? Result.where(request_id: params[:request_id]) : Result.all
  end

  def result_params
    params.require(:result).permit(:place, :height_result, :length_result, :score, :request_id)
  end
end

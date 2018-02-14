class SportsController < ApplicationController

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      redirect_to sports_path
    else
      render 'new'
    end
  end

  def index
    @q = Sport.ransack(params[:q])
    @sports = @q.result
  end

  private

  def sport_params
    params.require(:sport).permit(:name, :organizator, :date, :sport_id, :sport_complex_id)
  end
end
